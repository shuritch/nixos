# Hardware management

```nix
let monitorExample = {
  enabled = true;
  name = "DP-1";
  primary = true;
  width = 1920;
  height = 1080;
  scale = 1;
  refreshRate = 60;
  x = 0;
  y =0;
  rotate = 0;
  workspaces = ["1" "2"];
}; in {
  my.hardware = {
    audio = false;
    bluetooth = false;
    zram = false;
    monitors = []; # [monitorExample]
    gpu = null; # intel | amd | nvidia
    cpu = null; # intel | amd

    # Laptop
    lid = false;
    gyroscope = false;
    battery = {
      enable = false;
      upower.enable = lib.mkDefault config.my.hardware.battery.enable;
      undervolt.enable = lib.mkDefault config.my.hardware.battery.enable;
      cpufreq = {
        enable = config.my.hardware.battery.enable;
        onBatteryMinFreq = 1200;
        onBatteryMaxFreq = 1800;
        onChargerMinFreq = 1800;
        onChargerMaxFreq = 3800;
        thresholds = {
          enable = false;
          start = 20;
          stop = 80;
        };
      };
    };

    # inputs
    thunderbolt = true;
    webcam = false;
    mouse = false;
    touchscreen = false;
    keyboard = {
      toggle = "grp:alt_shift_toggle";
      languages = ["us" "ru"];
    };
  };
}
```
