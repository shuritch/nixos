{ lib, pkgs, config, ... }:

let cfg = config.my.boot;
in {
  options.my.boot.plymouth = {
    enable = lib.mkEnableOption "plymouth boot splash";
    theme = lib.mkOption {
      description = "Nameof plymouth theme";
      type = lib.types.nullOr lib.types.str;
      default = null;
    };

    themePackage = lib.mkOption {
      description = "Plymouth theme package";
      type = lib.types.nullOr lib.types.package;
      default = null;
    };
  };

  config = with cfg.plymouth;
    lib.mkIf enable {
      boot.plymouth = lib.mkMerge [
        { enable = true; }
        (lib.mkIf (theme != null) { inherit theme; })
        (lib.mkIf (themePackage != null) { themePackages = [ themePackage ]; })
      ];

      powerManagement = { # make plymouth work with sleep
        powerDownCommands = "${pkgs.plymouth} --show-splash";
        resumeCommands = "${pkgs.plymouth} --quit";
      };
    };
}
