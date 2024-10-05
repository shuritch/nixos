{ pkgs, config, lib, ... }:

let cfg = config.my.hardware;
in {
  config = lib.mkIf (cfg.gpu != null
    && (cfg.gpu == "intel" || lib.hasPrefix "hybrid-" cfg.gpu)) {
      boot.initrd.kernelModules = [ "i915" ];
      services.xserver.videoDrivers = [ "modesetting" ];
      hardware.intel-gpu-tools.enable = true;

      hardware.graphics = {
        extraPackages = builtins.attrValues {
          inherit (pkgs) libva-vdpau-driver intel-media-driver;
          intel-vaapi-driver =
            pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
        };

        extraPackages32 = builtins.attrValues {
          inherit (pkgs.pkgsi686Linux) libva-vdpau-driver intel-media-driver;
          intel-vaapi-driver = pkgs.pkgsi686Linux.intel-vaapi-driver.override {
            enableHybridCodec = true;
          };
        };
      };

      environment.variables = lib.mkIf
        (config.hardware.graphics.enable && cfg.gpu != "hybrid-nvidia") {
          VDPAU_DRIVER = "va_gl";
        };
    };
}
