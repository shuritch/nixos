{ config, lib, myLib, ... }:

let
  cfg = config.my.system;
  groups = import ./groups.nix config;
  admin = cfg.admin;
in {
  imports = [ ./admin.nix ./shell.nix ];

  options.my.system.users = lib.mkOption {
    default = { };
    description = "Configuration for users.";
    type = lib.types.attrsOf (lib.types.submodule {
      options = {
        email = lib.mkOption {
          description = "Admin user email.";
          default = "nixos-user@noreply.com";
          type = lib.types.str;
        };

        hashedPassword = lib.mkOption {
          description = "Admin user password.";
          type = lib.types.str;
          default = null;
        };

        description = lib.mkOption {
          description = "Admin user description.";
          default = "Nixos User";
          type = lib.types.str;
        };

        extraGroups = lib.mkOption {
          description = "Extra groups the user belongs to.";
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };

        home = lib.mkOption {
          description = "User hm environment";
          type = lib.types.submodule {
            options = {
              services = myLib.mkStubOption "Services options for hm";
              programs = myLib.mkStubOption "Apps options for hm";
              colorscheme = myLib.mkStubOption "Colorscheme options";
              desktop = myLib.mkStubOption "Desktop options for hm";
              cli = myLib.mkStubOption "CLI options for hm";
            };
          };

          default = {
            services = { };
            programs = { };
            desktop = { };
            cli = { };
          };
        };
      };
    });
  };

  config.users = {
    mutableUsers = lib.mkDefault false;
    allowNoPasswordLogin = false;
    enforceIdUniqueness = true;

    users = lib.mapAttrs (u: c: {
      extraGroups = c.extraGroups ++ (lib.optionalAttrs (u == admin) groups);
      inherit (c) hashedPassword description;
      useDefaultShell = true;
      isNormalUser = true;
    }) cfg.users;
  };
}
