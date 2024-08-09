{ pkgs, inputs, lib, myEnv, ... }:

let relative = lib.path.append ../../core/options;
in {
  networking.hostName = "hermes";
  system.stateVersion = myEnv.origin;
  imports = [
    ../../core/default.nix
    ./hardware-configuration.nix
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-cpu-intel
    (relative "auto-upgrade.nix")
    (relative "nvidia-gpu.nix")
    (relative "quietboot.nix")
    (relative "syncthing.nix")
    (relative "bluetooth.nix")
    (relative "database.nix")
    (relative "xserver.nix")
    (relative "greetd.nix")
    (relative "coding.nix")
    (relative "sound.nix")
    (relative "virt.nix")
    (relative "zram.nix")
    (relative "frkn.nix")
  ];

  nixpkgs.config.permittedInsecurePackages =
    [ "python-2.7.18.8" "electron-25.9.0" ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };

  # services.tlp.enable = true;
  hardware.opentabletdriver.enable = true;
  powerManagement.cpuFreqGovernor = "ondemand";
  powerManagement.powertop.enable = true;
  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      HandlePowerKey=ignore
    '';
  };

  services.acpid = {
    enable = true;
    lidEventCommands = ''
      export PATH=$PATH:/run/current-system/sw/bin

      lid_state=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $NF}')
      if [ $lid_state = "closed" ]; then
        # Set brightness to zero
        echo 0  > /sys/class/backlight/acpi_video0/brightness
      else
        # Reset the brightness
        echo 50  > /sys/class/backlight/acpi_video0/brightness
      fi
    '';

    powerEventCommands = ''
      systemctl suspend
    '';
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
    light.enable = true;
  };
}
