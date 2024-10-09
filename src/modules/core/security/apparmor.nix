{ lib, pkgs, config, ... }:

let cfg = config.my.security;
in {
  options.my.security.apparmor.enable = lib.mkEnableOption "Enable apparmor.";
  config = lib.mkIf cfg.apparmor.enable {
    services.dbus.apparmor = "disabled";
    security.apparmor = {
      enable = true;
      enableCache = true; # /var/cache/apparmore
      killUnconfinedConfinables = true;
      packages = [ pkgs.apparmor-profiles ];
      policies = {
        "default_deny" = {
          enforce = false;
          enable = false;
          profile = ''
            profile default_deny /** { }
          '';
        };

        "sudo" = {
          enforce = false;
          enable = false;
          profile = ''
            ${lib.getExe pkgs.sudo} {
              file /** rwlkUx,
            }
          '';
        };

        "nix" = {
          enforce = false;
          enable = false;
          profile = ''
            ${lib.getExe config.nix.package} {
              unconfined,
            }
          '';
        };
      };
    };
  };
}
