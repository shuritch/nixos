{ lib, config, ... }:
let cfg = config.my.hardware;
in {
  options.my.hardware.monitors = lib.mkOption {
    default = [ ];
    type = lib.types.listOf (lib.types.submodule {
      options = {
        name = lib.mkOption {
          type = lib.types.str;
          example = "DP-1";
        };
        primary = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        width = lib.mkOption {
          type = lib.types.int;
          example = 1920;
        };
        height = lib.mkOption {
          type = lib.types.int;
          example = 1080;
        };
        scale = lib.mkOption {
          type = lib.types.int;
          default = 1;
        };
        refreshRate = lib.mkOption {
          type = lib.types.int;
          default = 60;
        };
        x = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
        y = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
        rotate = lib.mkOption {
          type = lib.types.int;
          default = 0;
        };
        enabled = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        workspaces = lib.mkOption {
          type = lib.types.nullOr (lib.types.listOf lib.types.str);
          default = null;
        };
      };
    });
  };

  config = {
    assertions = [{
      assertion = ((lib.length cfg.monitors) != 0)
        -> ((lib.length (lib.filter (m: m.primary) cfg.monitors)) == 1);
      message = "Exactly one monitor must be set to primary.";
    }];
  };
}
