{ config, lib, ... }:

let cfg = config.my.system;
in {
  options.my.system = {
    flakePath = lib.mkOption {
      description = "Flake directory location.";
      default = /etc/nixos/flake;
      type = lib.types.path;
    };

    environment = lib.mkOption {
      description = "Extra environment variables";
      type = lib.types.attrsOf lib.types.str;
      default = { };
    };

    packages = lib.mkOption {
      description = "Extra packages";
      type = lib.types.listOf lib.types.package;
      default = [ ];
    };
  };

  config = {
    environment.systemPackages = cfg.packages;
    environment.variables = cfg.environment // {
      FLAKE = (toString cfg.flakePath);
    };

    environment.profileRelativeSessionVariables = { # QT FIX
      QT_PLUGIN_PATH = [ "/lib/qt-6/plugins" ];
    };
  };
}
