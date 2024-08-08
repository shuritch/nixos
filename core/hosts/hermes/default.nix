{ pkgs, inputs, vars, ... }: {
  networking.hostName = "hermes";
  system.stateVersion = vars.origin;
  imports = [
    inputs.hardware.nixosModules.common-pc-laptop-ssd
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-cpu-intel
    ./hardware-configuration.nix
    ../options/auto-upgrade.nix
    # ../options/quietboot.nix
    ../options/bluetooth.nix
    ../options/database.nix
    ../options/xserver.nix
    ../options/greetd.nix
    ../options/coding.nix
    ../options/sound.nix
    ../options/virt.nix
    ../../default.nix
  ];

  nixpkgs.config.permittedInsecurePackages =
    [ "python-2.7.18.8" "electron-25.9.0" ];

  services.tlp.enable = true;
  powerManagement.powertop.enable = true;
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };
}
