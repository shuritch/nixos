{ pkgs, inputs, myLib, ... }: {
  imports = myLib.pfxPaths ../../core/options [
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-laptop-ssd
    inputs.hardware.nixosModules.common-gpu-intel-comet-lake
    inputs.hardware.nixosModules.common-cpu-intel
    "systemd-boot.nix"
    "home-manager.nix"
    "auto-upgrade.nix"
    "powermanager.nix"
    "netmanager.nix"
    "gpu/intel.nix"
    "quietboot.nix"
    "syncthing.nix"
    "bluetooth.nix"
    "lidswitch.nix"
    "xserver.nix"
    "greetd.nix"
    "sound.nix"
    "zram.nix"
    "dev"
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };

  security.sudo.wheelNeedsPassword = false;
  services.printing.enable = true;
  hardware.sensor.iio.enable = true;
  hardware.opentabletdriver.enable = true;
  services.fstrim.enable = true;
  programs = {
    adb.enable = true;
    dconf.enable = true;
    light.enable = true;
  };
}
