{ config, lib, pkgs, ... }:

let cfg = config.my.system;
in {
  options.my.system = {
    flakePath = lib.mkOption {
      description = "Flake directory location.";
      default = /home/${config.my.system.admin}/flake;
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

  config.environment = {
    variables = cfg.environment // { FLAKE = (toString cfg.flakePath); };
    stub-ld.enable = true; # Kills dynamically linked executables
    defaultPackages = lib.mkForce [ ];
    systemPackages = cfg.packages ++ [
      pkgs.git
      pkgs.curl
      pkgs.wget
      pkgs.pciutils
      pkgs.lshw

    ];
  };
}
