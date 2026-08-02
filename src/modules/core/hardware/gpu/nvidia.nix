{ lib, config, pkgs, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware = {
    # Defined in ./default.nix
  };

  config = lib.mkIf (cfg.gpu == "nvidia") {
    services.xserver.videoDrivers = [ "nvidia" ];

    boot = {
      kernelParams = [ "nvidia-drm.fbdev=1" ];
      # blacklistedKernelModules = [ "nouveau" "snd_hda_codec_hdmi" ];
    };

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      WLR_DRM_DEVICES = lib.mkDefault "/dev/dri/card1";
      sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
      # GBM_BACKEND = "nvidia-drm"; # breaks firefox apparently
    };

    environment.systemPackages = with pkgs; [
      nvtopPackages.nvidia
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
      libva
      libva-utils
    ];

    hardware = {
      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.beta;
        modesetting.enable = lib.mkForce true;
        nvidiaPersistenced = true;
        nvidiaSettings = false;
        open = false;

        powerManagement = {
          finegrained = lib.mkDefault false;
          enable = lib.mkDefault true;
        };
      };

      graphics = {
        extraPackages = with pkgs; [ nvidia-vaapi-driver ];
        extraPackages32 = with pkgs.pkgsi686Linux; [ nvidia-vaapi-driver ];
      };
    };
  };
}
