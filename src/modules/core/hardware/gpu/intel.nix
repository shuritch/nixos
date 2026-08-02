{ lib, config, pkgs, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware = {
    # Defined in ./default.nix
  };

  config = lib.mkIf (cfg.gpu == "intel") {
    services.xserver.videoDrivers = [ "modesetting" ];
    hardware.intel-gpu-tools.enable = true;
    hardware.graphics = {
      extraPackages = lib.attrValues {
        inherit (pkgs) intel-media-driver intel-compute-runtime vpl-gpu-rt;
      };

      extraPackages32 = lib.attrValues {
        inherit (pkgs.pkgsi686Linux) intel-media-driver; # #
      };
    };
  };
}
