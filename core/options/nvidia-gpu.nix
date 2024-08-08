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

  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
    powerManagement.finegrained = false;
    powerManagement.enable = false;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };
}
