{ config, lib, pkgs, ... }: {
  programs.gamemode.enable = true;
  hardware.steam-hardware.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "nvidia-x11" "nvidia-settings" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ nvidia-vaapi-driver ];
  };

  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
    # nvidiaPersistenced = true;
    forceFullCompositionPipeline = true;
    powerManagement.finegrained = false;
    powerManagement.enable = false;
    modesetting.enable = true;
    nvidiaSettings = false;
    open = false;
  };

  environment = {
    sessionVariables.LIBVA_DRIVER_NAME = "nvidia";
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    systemPackages = with pkgs; [
      nvtopPackages.nvidia
      mesa
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
      libva
      libva-utils
    ];
  };
}
