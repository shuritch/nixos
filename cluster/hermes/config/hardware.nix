{
  my.hardware = {
    bluetooth = true;
    thunderbolt = true;
    webcam = true;
    audio = true;
    zram = true;

    battery = {
      enable = true;
      alert = true;
      undervolt.enable = true;
      upower.enable = true;
      cpufreq = {
        enable = true;
        battery.min = 1800;
        battery.max = 2400;
        charger.min = 2400;
        charger.max = 4700;
      };
    };

    input = {
      mouse = true;
      touchscreen = true;
      gyroscope = true;
    };

    cpu = "intel";
    gpu = "intel";
    monitors = [{
      name = "eDP-1";
      width = 3840;
      height = 2160;
      primary = true;
      workspaces = "1";
      scale = 2;
    }];
  };
}
