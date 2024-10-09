{ lib, config, ... }:

let cfg = config.my.boot;
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
  };
}
