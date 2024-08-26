{ pkgs, inputs, lib, myEnv, ... }:

let relative = lib.path.append ../../core/options;
in {
  networking.hostName = "atlas";
  system.stateVersion = myEnv.origin;

  imports = [
    ../../core/default.nix
    ./hardware-configuration.nix
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-cpu-intel
    (relative "auto-upgrade.nix")
    (relative "netmanager.nix")
    (relative "gpu/nvidia.nix")
    (relative "syncthing.nix")
    (relative "bluetooth.nix")
    (relative "xserver.nix")
    (relative "greetd.nix")
    (relative "sound.nix")
    (relative "frkn.nix")
    (relative "dns.nix")
    (relative "dev")
  ];

  nixpkgs.config.permittedInsecurePackages =
    [ "python-2.7.18.8" "electron-25.9.0" "electron-24.8.6" ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  # nix-shell -p lshw --run 'lshw -c display'
  hardware.nvidia.prime = {
    sync.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    intelBusId = "PCI:0:2:0";
    offload = {
      enable = false;
      enableOffloadCmd = false;
    };
  };
}
