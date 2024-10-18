{ config, lib, pkgs, ... }:

let cfg = config.my.services;
in {
  options.my.services.seatd.enable = lib.mkEnableOption "Enable seatd";
  config.systemd.services.seatd = lib.mkIf cfg.seatd.enable {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    description = "Seat management daemon";
    script = "${lib.getExe pkgs.seatd} -g wheel";
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      RestartSec = "1";
    };
  };
}
