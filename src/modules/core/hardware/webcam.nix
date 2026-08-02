{ lib, config, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware = {
    webcam = lib.mkEnableOption "Enable webcam kernel support.";
  };

  config = {
    boot.blacklistedKernelModules = lib.optionals (!cfg.webcam) [ "uvcvideo" ];
  };
}
