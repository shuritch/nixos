{ lib, ... }:

{
  options.originVersion = lib.MkOption {
    description = "Version of Nixos from ISO";
    type = lib.types.str;
    default = "23.11";
  };

  options.flakeLocation = lib.mkOption {
    description = "Path to flake.nix";
    type = lib.types.str;
    default = "$HOME/Desktop/NixConfig";
  };

  options.main-user = lib.mkOption {
    description = "User login (same as flake login)";
    type = lib.types.str;
    default = "admin";
  };

  options.users.users = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule ({
      options = {
        email = lib.mkOption {
          default = "";
          type = lib.types.str;
          description = "";
        };
      };
    }));
  };
}
