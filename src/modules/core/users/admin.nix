{ lib, config, ... }:

let
  admin = config.my.system.admin;
  cfg = config.my.system.${admin} or null;
in {
  options.my.system = {
    admin = lib.mkOption {
      description = "Login of admin user";
      type = lib.types.str;
      default = "nixos";
    };
  };

  config = lib.mkIf (admin != "nixos" && cfg != null) {
    users.users.root = { inherit (cfg) hashedPassword; };
  };
}
