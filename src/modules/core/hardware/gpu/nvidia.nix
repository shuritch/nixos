{ pkgs, config, lib, myLib, ... }:

let cfg = config.my.hardware;
in {
  config = lib.mkIf
    (cfg.gpu != null && (cfg.gpu == "nvidia" || cfg.gpu == "hybrid-nvidia")) {
      services.xserver = lib.mkMerge [
        { videoDrivers = [ "nvidia" ]; }
        (lib.mkIf (!(myLib.testHM config "desktop.isWayland")) {
          # disable DPMS
          monitorSection = ''
            Option "DPMS" "false"
          '';

          # disable screen blanking in general
          serverFlagsSection = ''
            Option "StandbyTime" "0"
            Option "SuspendTime" "0"
            Option "OffTime" "0"
            Option "BlankTime" "0"
          '';
        })
      ];

      boot = {
        blacklistedKernelModules = [ "nouveau" ];
        kernelParams = [ "nvidia-drm.fbdev=1" ];
      };

      nixpkgs.config.allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [ "nvidia-x11" "nvidia-settings" ];

      hardware = {
        graphics = {
          enable = true;
          enable32Bit = true;
          extraPackages = with pkgs; [ nvidia-vaapi-driver ];
          extraPackages32 = with pkgs.pkgsi686Linux; [ nvidia-vaapi-driver ];
        };

        nvidia = {
          package = config.boot.kernelPackages.nvidiaPackages.beta;
          modesetting.enable = lib.mkForce true;
          # forceFullCompositionPipeline = true;
          # nvidiaPersistenced = true;
          nvidiaSettings = false;
          open = false;

          prime = lib.mkIf (cfg.gpu == "hybrid-nvidia") {
            inherit (cfg.nvidiaPrime) amdgpuBusId nvidiaBusId intelBusId;
            offload = {
              enableOffloadCmd = true;
              enable = true;
            };
          };

          powerManagement = {
            finegrained = lib.mkDefault false;
            enable = lib.mkDefault true;
          };
        };
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
    };
}
