{ config, pkgs, lib, ... }:

let cfg = config.my.home.desktop;
in {
  imports = [ ./theme.nix ];
  config = lib.mkIf cfg.enable {
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    home.sessionVariables.GTK_USE_PORTAL = "1";

    gtk = {
      enable = true;
      font = ({
        inherit (cfg.fonts.regular) name;
        inherit (cfg.fonts.regular) size;
      });

      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-${
            if config.my.home.colorscheme.mode == "dark" then
              "Dark"
            else
              "Light"
          }";
      };

      cursorTheme = {
        name = "Vanilla-DMZ";
        package = pkgs.vanilla-dmz;
        size = 24;
      };
    };

    services.xsettingsd = {
      enable = true;
      settings = {
        "Net/ThemeName" = "${config.gtk.theme.name}";
        "Net/IconThemeName" = "${config.gtk.iconTheme.name}";
      };
    };
  };
}
