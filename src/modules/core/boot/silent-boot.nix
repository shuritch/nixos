{ lib, config, ... }:

let cfg = config.my.boot;
in {
  options.my.boot = {
    silentBoot = lib.mkEnableOption "Enables `quiet` kernel parameter." // {
      default = cfg.plymouth.enable;
    };
  };

  config.boot = {
    kernelParams = (lib.optionals cfg.silentBoot [
      "quite" # tell the kernel to not be verbose
      "loglevel=3" # kernel log message level
      "udev.log_level=3" # udev log message level
      "rd.udev.log_level=3" # lower the udev log level
      "systemd.show_status=auto" # disable systemd status messages
      "rd.systemd.show_status=auto" # systemd-udev will be used instead of initrd
    ]);
  };
}
