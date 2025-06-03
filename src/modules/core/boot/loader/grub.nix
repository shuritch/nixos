{ lib, config, ... }:

let
  cfg = config.my.boot;
  mainMonitor = lib.lists.findSingle (x: x.primary == true) null null
    config.my.hardware.monitors;
in {
  options.my.boot = {
    device = lib.mkOption {
      description = "The device to install the bootloader to.";
      type = lib.types.nullOr lib.types.str;
      default = "nodev";
    };

    grubTheme = lib.mkOption {
      description = "Theme for GRUB menu.";
      type = lib.types.package;
      default = null;
    };
  };

  config.boot.loader.grub = lib.mkIf (cfg.loader == "grub") {
    configurationLimit = cfg.configurationLimit;
    theme = cfg.grubTheme;
    device = cfg.device;
    enableCryptodisk = lib.mkDefault false;
    enable = lib.mkDefault true;
    useOSProber = true;
    efiSupport = true;
    extraConfig = ''
      GRUB_GFXMODE="${toString mainMonitor.width}x${
        toString mainMonitor.height
      }"
    '';
  };
}
