{ pkgs, inputs, myLib, ... }: {
  imports = myLib.pfxPaths ../../core/options [
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-cpu-intel
    "auto-upgrade.nix"
    "home-manager.nix"
    "netmanager.nix"
    "gpu/nvidia.nix"
    "syncthing.nix"
    "bluetooth.nix"
    "xserver.nix"
    "greetd.nix"
    "sound.nix"
    "frkn.nix"
    "grub.nix"
    "dns.nix"
    "dev"
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };

  services.printing.enable = true;
  services.fstrim.enable = true;
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
