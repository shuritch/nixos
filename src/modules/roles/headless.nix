{ lib, config, ... }: {
  config = lib.mkIf (builtins.elem "headless" config.my.system.roles) {
    my.system.docs = lib.mkForce false;
    services.udisks2.enable = lib.modules.mkForce false; # Explicit user action
    environment.variables.BROWSER = "echo"; # Prints the URL instead
    xdg = lib.mapAttrs (_: lib.mkForce) {
      sounds.enable = false;
      mime.enable = false;
      menus.enable = false;
      icons.enable = false;
      autostart.enable = false;
    };

    fonts = { # we don't need fonts on a server
      packages = lib.mkForce [ ];
      fontDir.enable = lib.mkForce false;
      fontconfig.enable = lib.mkForce false;
    };

    systemd = {
      # https://github.com/numtide/srvos/blob/main/nixos/server/default.nix
      enableEmergencyMode = false; # Emergency mode is useless here.
      watchdog = {
        # https://0pointer.de/blog/projects/watchdog.html
        runtimeTime = "20s"; # Reboot if watchdog doesn't get a signal for 20s
        # https://utcc.utoronto.ca/~cks/space/blog/linux/SystemdShutdownWatchdog
        rebootTime = "30s"; # Reboot if no progress while boot after 30s
      };

      sleep.extraConfig = ''
        AllowSuspend=no
        AllowHibernation=no
      '';
    };
  };
}
