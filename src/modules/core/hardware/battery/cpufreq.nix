{ lib, config, ... }:
let
  cfg = config.my.hardware.battery;
  MHz = x: x * 1000;
in {
  options.my.hardware.battery.cpufreq = {
    enable = lib.mkEnableOption "Enable cpu frequency." // {
      default = cfg.enable;
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

    battery = {
      min = lib.mkOption {
        description = "Minimum CPU frequency in MHz on battery.";
        type = lib.types.number;
        default = 1200;
      };

      max = lib.mkOption {
        description = "Maximum CPU frequency in MHz on battery.";
        type = lib.types.number;
        default = 1800;
      };
    };

    charger = {
      min = lib.mkOption {
        description = "Minimum CPU frequency in MHz on charger.";
        type = lib.types.number;
        default = 1800;
      };

      max = lib.mkOption {
        description = "Maximum CPU frequency in MHz on charger.";
        type = lib.types.number;
        default = 3800;
      };
    };
  };

  # <https://github.com/AdnanHodzic/auto-cpufreq/#example-config-file-contents>
  config.services.auto-cpufreq = lib.mkIf cfg.cpufreq.enable {
    enable = true;

    settings = {
      battery = {
        governor = "powersave";
        energy_performance_preference = "power";
        scaling_min_freq = (MHz cfg.cpufreq.battery.min);
        scaling_max_freq = (MHz cfg.cpufreq.battery.max);
        turbo = "never";

        enable_thresholds = cfg.cpufreq.thresholds.enable;
        start_threshold = cfg.cpufreq.thresholds.start;
        stop_threshold = cfg.cpufreq.thresholds.stop;
      };

      charger = {
        governor = "performance";
        energy_performance_preference = "performance";
        scaling_min_freq = (MHz cfg.cpufreq.charger.min);
        scaling_max_freq = (MHz cfg.cpufreq.charger.max);
        turbo = "auto";
      };
    };
  };
}
