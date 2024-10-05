{ lib, config, ... }:

let cfg = config.my.boot;
in {
  config.boot.loader.systemd-boot = lib.mkIf (cfg.loader == "systemd-boot") {
    configurationLimit = cfg.configurationLimit;
    enable = lib.mkDefault true;
    consoleMode = "max";
    editor = false;
  };
}
