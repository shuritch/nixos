{
  services.gammastep = {
    enable = true;
    settings = { general.adjustment-method = "wayland"; };
    enableVerboseLogging = true;
    provider = "geoclue2";
    temperature = {
      day = 6000;
      night = 4600;
    };
  };
}
