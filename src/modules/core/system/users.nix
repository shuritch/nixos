{ lib, config, pkgs, myLib, ... }:

let cfg = config.my.system;
in {
  options.my.system = {
    admin = lib.mkOption {
      description = "Login of admin user";
      type = lib.types.str;
      default = lib.findFirst (u: u.isAdmin) "nixos" cfg.users;
    };

    users = lib.mkOption {
      default = { };
      description = "Configuration for users.";
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          isAdmin = lib.mkOption {
            description = "Is current user an admin";
            type = lib.types.bool;
            default = false;
          };

          email = lib.mkOption {
            description = "User email.";
            default = "nixos-user@noreply.com";
            type = lib.types.str;
          };

          hashedPassword = lib.mkOption {
            description = "User password.";
            type = lib.types.str;
            default = null;
          };

          description = lib.mkOption {
            description = "User description.";
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
  };

  config = {
    # services.userborn.enable = true; TODO
    users = {
      mutableUsers = lib.mkDefault false;
      allowNoPasswordLogin = false;
      enforceIdUniqueness = true;
      defaultUserShell = pkgs.fish;
      users = {
        root = { inherit (cfg.${cfg.admin}) hashedPassword; };
      } // lib.mapAttrs (user: config: {
        inherit (config) hashedPassword description;
        home = "/home/${user}";
        useDefaultShell = true;
        isNormalUser = true;
        extraGroups = config.extraGroups ++ lib.optionals (user == cfg.admin)
          (builtins.filter (group: builtins.hasAttr group config.users.groups) [
            "nix"
            "wheel"
            "network"
            "networkmanager"
            "systemd-journal"
            "audio"
            "pipewire"
            "video"
            "input"
            "plugdev"
            "lp"
            "i2c"
            "tss"
            "power"
            "git"
            "acme"
            "tpws"
            "mysql"
            "tcpcryptd"
            "deluge"
            "minecraft"
            "wireshark"
            "libvirtd"
            "podman"
            "docker"
            "sing-box"
            "lxd"
          ]);
      }) cfg.users;
    };

    assertions = [{
      assertion = ((lib.length cfg.users) != 0)
        -> ((lib.length (lib.filter (u: u.isAdmin) cfg.users)) == 1);
      message = "Exactly one user must be admin.";
    }];
  };
}
