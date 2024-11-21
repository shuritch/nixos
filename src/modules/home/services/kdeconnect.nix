{ pkgs, lib, config, ... }:

let cfg = config.my.home.services;
in {
  options.my.home.services.kdeconnect.enable =
    lib.mkEnableOption "Enable kdeconnect.";

  config = lib.mkIf cfg.kdeconnect.enable {
    services.kdeconnect = {
      package = pkgs.kdePackages.kdeconnect-kde;
      indicator = true;
      enable = true;
    };

    xdg.desktopEntries = {
      "org.kde.kdeconnect.sms" = {
        exec = "";
        name = "KDE Connect SMS";
        settings.NoDisplay = "true";
      };

      "org.kde.kdeconnect.nonplasma" = {
        exec = "";
        name = "KDE Connect Indicator";
        settings.NoDisplay = "true";
      };

      "org.kde.kdeconnect.app" = {
        exec = "";
        name = "KDE Connect";
        settings.NoDisplay = "true";
      };
    };
  };
}
