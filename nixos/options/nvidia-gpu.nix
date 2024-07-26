{ config, lib, ... }: {
  programs.gamemode.enable = true;
  hardware.steam-hardware.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "nvidia-x11" "nvidia-settings" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    powerManagement.finegrained = false;
    powerManagement.enable = false;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
