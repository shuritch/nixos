{ lib, config, ... }:

let cfg = config.my.home.services;
in {
  options.my.home.services.udiskie.enable =
    lib.mkEnableOption "Enable udiskie.";

  config.services = lib.mkIf cfg.udiskie.enable {
    udiskie = {
      enable = true;
      automount = true;
      tray = "auto";
    };
  };
}
