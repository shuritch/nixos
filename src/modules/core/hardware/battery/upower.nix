{ lib, config, ... }:

let cfg = config.my.hardware.battery;
in {
  options.my.hardware.battery.upower.enable =
    lib.mkEnableOption "Enable upower support." // {
      default = cfg.enable;
    };

  config.services.upower = lib.mkIf cfg.upower.enable {
    enable = true;
    percentageLow = 15;
    percentageCritical = 5;
    percentageAction = 3;
    criticalPowerAction = "Hibernate";
  };
}
