{ pkgs, lib, config, myEnv, ... }:
# TODO: Maybe move to home
let
  homeCfgs = config.home-manager.users;
  userCfg = homeCfgs.${myEnv.admin.login};
  gtkTheme = userCfg.gtk.theme;
  iconTheme = userCfg.gtk.iconTheme;
  wallpaper = userCfg.wallpaper;

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
    packages = [ gtkTheme.package iconTheme.package ];
    home = "/tmp/greeter-home"; # For caching and such
    createHome = true;
  };

  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        icon_theme_name = lib.mkForce "Papirus";
        theme_name = lib.mkForce gtkTheme.name;
      };
      background = {
        path = wallpaper;
        fit = "Cover";
      };
    };
  };

  services.greetd = {
    enable = true;
    settings.default_session.command =
      sway-kiosk (lib.getExe config.programs.regreet.package);
  };
}
