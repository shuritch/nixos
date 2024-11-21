{ config, lib, pkgs, ... }:

let cfg = config.my.home.desktop;
in {
  imports = [ ./environment ./managers ];
  options.my.home.desktop.enable = lib.mkEnableOption "Enable desktop support.";
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ libnotify brightnessctl ];
    dconf.settings."org/gnome/desktop/interface".color-scheme =
      if config.my.home.colorscheme.mode == "dark" then
        "prefer-dark"
      else if config.my.home.colorscheme.mode == "light" then
        "prefer-light"
      else
        "default";
  };
}
