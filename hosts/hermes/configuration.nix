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
    (relative "powermanager.nix")
    (relative "auto-upgrade.nix")
    (relative "nvidia-gpu.nix")
    (relative "quietboot.nix")
    (relative "syncthing.nix")
    (relative "bluetooth.nix")
    (relative "lidswitch.nix")
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

  hardware.opentabletdriver.enable = true;
  programs = {
    adb.enable = true;
    dconf.enable = true;
    light.enable = true;
  };
}
