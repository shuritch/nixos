{ pkgs, config, lib, myLib, ... }:

let
  homeCfgs = config.home-manager.users or { };
  userCfg = homeCfgs.${config.my.system.admin} or null;
  homeSharePaths = lib.mapAttrsToList (_: v: "${v.home.path}/share") homeCfgs;
  variables = ''
    XDG_DATA_DIRS="$XDG_DATA_DIRS:${
      lib.concatStringsSep ":" homeSharePaths
    }" GTK_USE_PORTAL=0'';

  sway-kiosk = command:
    "${lib.getExe pkgs.sway} --unsupported-gpu --config ${
      pkgs.writeText "kiosk.config" ''
        output * bg #000000 solid_color
        xwayland disable
        input "type:touchpad" {
          tap enabled
        }
        exec '${variables} ${command}; ${pkgs.sway}/bin/swaymsg exit'
      ''
    }";
in {
  config = (lib.mkIf ((config.my.security.login == "greetd")
    && (myLib.testHM config "desktop.enable"))) {
      users.extraUsers.greeter = {
        home = "/tmp/greeter-home";
        createHome = true;
      };

      programs.regreet = (lib.optionalAttrs (userCfg != null) {
        enable = true;
        theme = userCfg.gtk.theme;
        iconTheme = userCfg.gtk.iconTheme;
        cursorTheme = { inherit (userCfg.gtk.cursorTheme) name package; };
        font = userCfg.my.home.desktop.fonts.regular;
        settings.background = {
          path = userCfg.my.home.desktop.wallpaper;
          fit = "Cover";
        };
      });

      services.greetd = (lib.optionalAttrs (userCfg != null) {
        enable = true;
        settings.default_session.command =
          sway-kiosk (lib.getExe config.programs.regreet.package);
      });
    };
}
