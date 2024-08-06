let
  native = "ru_RU.UTF-8";
  en = "en_US.UTF-8";
in {
  # location.provider = "geoclue2";
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
  i18n = {
    defaultLocale = en;
    supportedLocales = [ "C.UTF-8/UTF-8" "${en}/UTF-8" "${native}/UTF-8" ];
    extraLocaleSettings = {
      # LC_ADDRESS = native;
      # LC_IDENTIFICATION = native;
      # LC_MEASUREMENT = native;
      # LC_MONETARY = native;
      # LC_NAME = native;
      # LC_NUMERIC = native;
      # LC_PAPER = native;
      # LC_TELEPHONE = native;
      LC_TIME = en;
    };
  };
}
