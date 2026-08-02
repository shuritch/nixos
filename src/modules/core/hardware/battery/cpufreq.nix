{ lib, config, ... }:

let cfg = config.my.hardware.battery;
in {
  options.my.hardware.battery.cpufreq = {
    enable = lib.mkEnableOption "Enable cpu frequency." // {
      default = cfg.enable;
    };

    onBatteryMinFreq = lib.mkOption {
      description = "Minimum CPU frequency in MHz on battery.";
      type = lib.types.number;
      default = 1200;
    };

    onBatteryMaxFreq = lib.mkOption {
      description = "Maximum CPU frequency in MHz on battery.";
      type = lib.types.number;
      default = 1800;
    };

    onChargerMinFreq = lib.mkOption {
      description = "Minimum CPU frequency in MHz on charger.";
      type = lib.types.number;
      default = 1800;
    };

    onChargerMaxFreq = lib.mkOption {
      description = "Maximum CPU frequency in MHz on charger.";
      type = lib.types.number;
      default = 3800;
    };

    thresholds = {
      enable = lib.mkEnableOption "Enable battery thresholds.";
      start = lib.mkOption {
        description = "Start charging at X%.";
        type = lib.types.number;
        default = 20;
      };

      stop = lib.mkOption {
        description = "Stop charging at X%.";
        type = lib.types.number;
        default = 80;
      };
    };
  };

  # <https://github.com/AdnanHodzic/auto-cpufreq/#example-config-file-contents>
  config.services.auto-cpufreq = lib.mkIf cfg.cpufreq.enable {
    enable = true;
    settings = let MHz = x: x * 1000;
    in {
      battery = {
        governor = "powersave";
        energy_performance_preference = "power";
        scaling_min_freq = (MHz cfg.cpufreq.onBatteryMinFreq);
        scaling_max_freq = (MHz cfg.cpufreq.onBatteryMaxFreq);
        turbo = "never";

        enable_thresholds = cfg.cpufreq.thresholds.enable;
        start_threshold = cfg.cpufreq.thresholds.start;
        stop_threshold = cfg.cpufreq.thresholds.stop;
      };

      charger = {
        governor = "performance";
        energy_performance_preference = "performance";
        scaling_min_freq = (MHz cfg.cpufreq.onChargerMinFreq);
        scaling_max_freq = (MHz cfg.cpufreq.onChargerMaxFreq);
        turbo = "auto";
      };
    };
  };
}
