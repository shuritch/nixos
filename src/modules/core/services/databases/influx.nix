{ lib, myLib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.influxdb = myLib.mkServiceOption { name = "influxdb"; };
  config = lib.mkIf cfg.influxdb.enable { services.influxdb.enable = true; };
}
