{ pkgs, lib, myLib, ... }:

with myLib; {
  imports = pfxPaths ../../home/options [ "desktop/hyprland" "apps" "cli" ];
  wallpaper = pkgs.wallpapers.ship-in-storm;
  monitors = [
    { # DELL WE
      name = "HDMI-A-3";
      width = 3440;
      height = 1440;
      x = 2560;
      y = 0;
      workspace = "1";
      primary = true;
    }
    { # DELL W
      name = "HDMI-A-5";
      width = 3440;
      height = 1440;
      x = 2560;
      y = 1440;
      workspace = "2";
      rotate = 2;
    }
    { # BENQ
      name = "HDMI-A-4";
      width = 2560;
      height = 1440;
      x = 0;
      y = 720;
      workspace = "3";
    }
  ];

  wayland.windowManager.hyprland.extraConfig = lib.mkBefore ''
    exec-once = [workspace 2 silent] firefox
    exec-once = [workspace f1 silent] thunderbird
    exec-once = [workspace 1 silent] silent-code
  '';
}
