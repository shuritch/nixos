{ lib, myLib, pkgs, ... }:

with myLib; {
  imports = pfxPaths ../../home/options [ "desktop/hyprland" "apps" "cli" ];
  wallpaper = pkgs.wallpaper-ship-in-storm;
  monitors = [
    { # DELL WE
      name = "HDMI-A-3";
      workspace = "1";
      primary = true;
      width = 3440;
      height = 1440;
      x = 2560;
      y = 0;
    }
    { # DELL W
      name = "HDMI-A-5";
      workspace = "2";
      width = 3440;
      height = 1440;
      x = 2560;
      y = 1440;
      rotate = 2; # n * 90
    }
    { # BENQ
      name = "HDMI-A-4";
      workspace = "3";
      width = 2560;
      height = 1440;
      x = 0;
      y = 720;
    }
  ];

  wayland.windowManager.hyprland.extraConfig = lib.mkBefore ''
    exec-once = [workspace name:0 silent] thunderbird
    exec-once = [workspace 1 silent] silent-code
    exec-once = [workspace 2 silent] firefox
  '';
}
