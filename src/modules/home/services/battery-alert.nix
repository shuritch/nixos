{ config, pkgs, lib, ... }:

let cfg = config.my.home.services;
in {
  options.my.home.services.battery-alert.enable =
    lib.mkEnableOption "Enable battery alerts.";

  config = lib.mkIf cfg.battery-alert.enable {
    systemd.user.services.battery-alert = {
      Unit.Description = "Battery alerts";
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.battery-alert}/bin/battery-alert";
      };
    };

    systemd.user.timers.battery-alert = {
      Unit.Description = "Notifier Timer";
      Install.WantedBy = [ "timers.target" ];
      Timer = {
        OnBootSec = "1m";
        OnUnitInactiveSec = "5m";
      };
    };
  };
}
