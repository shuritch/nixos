{ pkgs, inputs, lib, myEnv, ... }:

let relative = lib.path.append ../../core/options;
in {
  networking.hostName = "atlas";
  system.stateVersion = myEnv.origin;

  imports = [
    ../../core/default.nix
    ./hardware-configuration.nix
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-cpu-intel
    (relative "auto-upgrade.nix")
    (relative "nvidia-gpu.nix")
    # (relative "options/quietboot.nix")
    (relative "bluetooth.nix")
    (relative "database.nix")
    (relative "xserver.nix")
    (relative "greetd.nix")
    (relative "coding.nix")
    (relative "sound.nix")
    (relative "virt.nix")
    (relative "frkn.nix")
  ];

  nixpkgs.config.permittedInsecurePackages =
    [ "python-2.7.18.8" "electron-25.9.0" ];

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
      # enableOffloadCmd = true;
    };
  };
}
