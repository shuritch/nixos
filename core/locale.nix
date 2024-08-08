let
  native = "ru_RU.UTF-8";
  en = "en_US.UTF-8";
in {
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n = {
    defaultLocale = en;
    supportedLocales = [ "C.UTF-8/UTF-8" "${en}/UTF-8" "${native}/UTF-8" ];
    extraLocaleSettings = { LC_TIME = en; };
  };
}
