{ lib, config, pkgs, ... }:

let cfg = config;
in {
  options.my.security = {
    # Doesn't require options
  };

  config = {
    services.dbus.apparmor = "disabled";
    security.apparmor = {
      enable = true;
      enableCache = true; # /var/cache/apparmore
      killUnconfinedConfinables = true;
      packages = [ pkgs.apparmor-profiles ];
      policies = {
        "default_deny" = {
          state = "disable";
          profile = ''
            profile default_deny /** { }
          '';
        };

        "sudo" = {
          state = "disable";
          profile = ''
            ${lib.getExe pkgs.sudo} {
              file /** rwlkUx,
            }
          '';
        };

        "nix" = {
          state = "disable";
          profile = ''
            ${lib.getExe cfg.nix.package} {
              unconfined,
            }
          '';
        };
      };
    };
  };
}
