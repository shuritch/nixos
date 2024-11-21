{ lib, config, ... }:

let cfg = config.my.home.services;
in {
  options.my.home.services.udiskie.enable =
    lib.mkEnableOption "Enable udiskie.";

  config.services.udiskie.enable = lib.mkIf cfg.udiskie.enable {
    enable = true;
    automount = true;
    tray = "auto";
  };
}
