{ pkgs, lib, config, myEnv, ... }:

let
  homeCfgs = config.home-manager.users;
  userCfg = homeCfgs.${myEnv.admin.login};
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
  users.extraUsers.greeter = {
    home = "/tmp/greeter-home";
    createHome = true;
  };

  programs.regreet = {
    enable = true;
    iconTheme = userCfg.gtk.iconTheme;
    theme = userCfg.gtk.theme;
    cursorTheme = { inherit (userCfg.gtk.cursorTheme) name package; };
    font.name = userCfg.fontProfiles.regular.family;
    settings.background = {
      path = userCfg.wallpaper;
      fit = "Cover";
    };
  };

  services.greetd = {
    enable = true;
    settings.default_session.command =
      sway-kiosk (lib.getExe config.programs.regreet.package);
  };
}
