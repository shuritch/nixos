{ config, lib, pkgs, ... }:

let cfg = config.my.hardware.battery;
in {
  options.my.hardware.battery.undervolt.enable =
    lib.mkEnableOption "Enable undervolt." // {
      default = cfg.enable;
    };

  config.services.undervolt = lib.mkIf cfg.undervolt.enable {
    enable = config.my.hardware.cpu == "intel";
    package = pkgs.undervolt;
    tempBat = 65; # deg C
  };
}
