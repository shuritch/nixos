{ config, lib, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware.input = {
    mouse = lib.mkEnableOption "Enable mouse and touchpad support.";
    touchscreen = lib.mkEnableOption "Enable touchscreen support.";
    gyroscope = lib.mkEnableOption "Enable gyroscope support.";

    keyboard = {
      # https://andgera.livejournal.com/14162.html
      toggle = lib.mkOption {
        description = "Language toggle bind.";
        default = "grp:alt_shift_toggle";
        type = lib.types.str;
      };

      languages = lib.mkOption {
        description = "List of Supported languages.";
        type = lib.types.listOf lib.types.str;
        default = [ "us" "ru" ];
      };
    };
  };

  config = lib.mkMerge [
    {
      services = {
        libinput = lib.mkIf cfg.input.mouse {
          enable = true;
          mouse = {
            accelProfile = "adaptive";
            middleEmulation = false;
          };

          touchpad = {
            accelProfile = "adaptive";
            scrollMethod = "twofinger";
            horizontalScrolling = false;
            disableWhileTyping = true;
            naturalScrolling = true;
            accelSpeed = "0.7";
          };
        };

        xserver.xkb = {
          layout = builtins.concatStringsSep "," cfg.input.keyboard.languages;
          options = cfg.input.keyboard.toggle;
          variant = "lang";
        };
      };
    }

    (lib.mkIf cfg.input.gyroscope {
      hardware.sensor.iio.enable = true;
      hardware.opentabletdriver.enable = true;
    })
  ];
}
