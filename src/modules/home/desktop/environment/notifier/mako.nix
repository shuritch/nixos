{ config, lib, ... }:

let cfg = config.my.home.desktop;
in {
  config.services.mako = lib.mkIf (cfg.enable && cfg.notifier == "mako") {
    enable = true;
    settings = {
      icon-path = if config.my.home.colorscheme.mode == "dark" then
        "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark"
      else
        "${config.gtk.iconTheme.package}/share/icons/Papirus-Light";
      font = "${cfg.fonts.regular.name} ${toString cfg.fonts.regular.size}";
      background-color = "${config.my.home.colorscheme.colors.surface}dd";
      border-color = "${config.my.home.colorscheme.colors.secondary}dd";
      text-color = "${config.my.home.colorscheme.colors.on_surface}dd";
      padding = "10,20";
      anchor = "bottom-center";
      width = 400;
      height = 150;
      border-size = 2;
      default-timeout = 12000;
      layer = "overlay";
      max-history = 50;
    };
  };
}
