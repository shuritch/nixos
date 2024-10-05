{ lib, config, ... }:

let cfg = config.my.system;
in {
  options.my.system = {
    timeZone = lib.mkOption {
      description = "Time zone.";
      default = "Europe/Moscow";
      type = lib.types.str;
    };

    defaultLocale = lib.mkOption {
      type = lib.types.str;
      description = "System locale.";
      default = "en_US";
    };

    extraLocales = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "Extra locale settings.";
      default = [ "ru_RU" ];
    };
  };

  config = {
    time = {
      timeZone = cfg.timeZone;
      hardwareClockInLocalTime = true;
    };

    i18n = {
      defaultLocale = "${cfg.defaultLocale}.UTF-8";

      supportedLocales = [ "C.UTF-8/UTF-8" "${cfg.defaultLocale}.UTF-8/UTF-8" ]
        ++ map (l: "${l}.UTF-8/UTF-8") cfg.extraLocales;

      extraLocaleSettings = {
        LANG = "${cfg.defaultLocale}.UTF-8";
        LC_COLLATE = "${cfg.defaultLocale}.UTF-8";
        LC_CTYPE = "${cfg.defaultLocale}.UTF-8";
        LC_MESSAGES = "${cfg.defaultLocale}.UTF-8";
        LC_ADDRESS = "${cfg.defaultLocale}.UTF-8";
        LC_IDENTIFICATION = "${cfg.defaultLocale}.UTF-8";
        LC_MEASUREMENT = "${cfg.defaultLocale}.UTF-8";
        LC_MONETARY = "${cfg.defaultLocale}.UTF-8";
        LC_NAME = "${cfg.defaultLocale}.UTF-8";
        LC_NUMERIC = "${cfg.defaultLocale}.UTF-8";
        LC_PAPER = "${cfg.defaultLocale}.UTF-8";
        LC_TELEPHONE = "${cfg.defaultLocale}.UTF-8";
        LC_TIME = "${cfg.defaultLocale}.UTF-8";
      };
    };
  };
}
