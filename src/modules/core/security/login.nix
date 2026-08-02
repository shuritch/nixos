{ lib, config, pkgs, myLib, ... }:

let
  homeCfgs = config.home-manager.users or { };
  cfg = homeCfgs.${config.my.system.admin} or null;
  homeSharePaths = lib.mapAttrsToList (_: v: "${v.home.path}/share") homeCfgs;
  variables = ''
    XDG_DATA_DIRS="$XDG_DATA_DIRS:${
      lib.concatStringsSep ":" homeSharePaths
    }" GTK_USE_PORTAL=0'';
in {
  options.my.security = {
    # Doesn't require options
  };

  config = (lib.mkIf (myLib.testHM config "desktop.enable")) {
    users.extraUsers.greeter = {
      home = "/tmp/greeter-home";
      createHome = true;
    };

    programs.regreet = {
      enable = true;
      theme = cfg.gtk.theme;
      iconTheme = cfg.gtk.iconTheme;
      cursorTheme = { inherit (cfg.gtk.cursorTheme) name package; };
      font = cfg.my.home.desktop.fonts.regular;
      settings.background = {
        path = cfg.my.home.desktop.wallpaper;
        fit = "Cover";
      };
    };

    services.greetd = {
      enable = true;
      settings.default_session.command =
        "${lib.getExe pkgs.sway} --unsupported-gpu --config ${
          pkgs.writeText "kiosk.config" ''
            output * bg #000000 solid_color
            xwayland disable
            input "type:touchpad" {
              tap enabled
            }
            exec '${variables} ${
              lib.getExe config.programs.regreet.package
            }; ${pkgs.sway}/bin/swaymsg exit'
          ''
        }";
    };

    # Laptop actions
    services.logind = {
      HandleLidSwitch = "ignore";
      HandleLidSwitchDocked = "ignore";
      HandleLidSwitchExternalPower = "ignore";
      HandlePowerKey = "suspend-then-hibernate";
    };

    # Logind alternative
    services.seatd.enable = true;

    # https://wiki.debian.org/Suspend#Disable_suspend_and_hibernation
    systemd.sleep.settings.sleep = {
      AllowSuspend = false;
      AllowHibernation = false;
      AllowSuspendThenHibernate = false;
      AllowHybridSleep = false;
    };
  };
}
