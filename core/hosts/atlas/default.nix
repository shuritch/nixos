{ pkgs, inputs, vars, ... }: {
  networking.hostName = "atlas";
  system.stateVersion = vars.origin;
  imports = [
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-cpu-intel
    ./hardware-configuration.nix
    ../options/auto-upgrade.nix
    ../options/nvidia-gpu.nix
    # ../options/quietboot.nix
    ../options/bluetooth.nix
    ../options/database.nix
    ../options/xserver.nix
    ../options/greetd.nix
    ../options/coding.nix
    ../options/sound.nix
    ../options/virt.nix
    ../options/frkn.nix
    ../../default.nix
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
