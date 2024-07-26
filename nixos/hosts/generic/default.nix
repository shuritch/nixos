{ pkgs, inputs, ... }: {
  originVersion = "23.11"; # TODO
  networking.hostname = "generic";
  flakeLocation = "$HOME/Desktop/OS"; # TODO: Move/Create
  imports = [
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-cpu-intel
    ./hardware-configuration.nix
    ../../common/users/sashapop10.nix # TODO
    # ../../options/nvidia-gpu.nix
    ../../options/bluetooth.nix
    ../../options/quietboot.nix
    ../../options/greetd.nix
    ../../options/sound.nix
    ../../options/virt.nix
    ../..
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };
}
