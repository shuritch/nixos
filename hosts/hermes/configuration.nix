{ pkgs, inputs, lib, myEnv, ... }:

let relative = lib.path.append ../../core/options;
in {
  networking.hostName = "hermes";
  system.stateVersion = myEnv.origin;
  imports = [
    ../../core/default.nix
    ./hardware-configuration.nix
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-laptop-ssd
    inputs.hardware.nixosModules.common-gpu-intel-comet-lake
    inputs.hardware.nixosModules.common-cpu-intel
    (relative "auto-upgrade.nix")
    (relative "powermanager.nix")
    (relative "gpu/intel.nix")
    (relative "quietboot.nix")
    (relative "syncthing.nix")
    (relative "bluetooth.nix")
    (relative "lidswitch.nix")
    (relative "xserver.nix")
    (relative "greetd.nix")
    (relative "sound.nix")
    (relative "zram.nix")
    (relative "frkn.nix")
    (relative "dev")
  ];

  nixpkgs.config.permittedInsecurePackages =
    [ "python-2.7.18.8" "electron-25.9.0" ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };

  hardware.sensor.iio.enable = true;
  hardware.opentabletdriver.enable = true;
  programs = {
    adb.enable = true;
    dconf.enable = true;
    light.enable = true;
  };
}
