{ pkgs, lib, config, ... }:

let
  packageNames = map (p: p.pname or p.name or null) config.home.packages;
  hasPackage = name: lib.any (x: x == name) packageNames;
in {
  imports = [
    ../../home/default.nix
    ../../home/desktop/hyprland
    # ../../home/apps/games
    ../../home/apps
    ../../home/cli
  ];

  wallpaper = pkgs.wallpapers.ship-in-storm;
  monitors = [
    {
      name = "HDMI-A-4"; # BENQ
      width = 2560;
      height = 1440;
      x = 0;
      y = 720;
      workspace = "3";
    }
    {
      name = "HDMI-A-3"; # DELL WE
      width = 3440;
      height = 1440;
      x = 2560;
      y = 0;
      workspace = "1";
      primary = true;
    }
    {
      name = "HDMI-A-5"; # DELL W
      width = 3440;
      height = 1440;
      x = 2560;
      y = 1440;
      workspace = "2";
      rotate = 2;
    }
  ];

  wayland.windowManager.hyprland.extraConfig = lib.mkBefore ''
    ${if config.programs.kitty.enable then
      "exec-once = [workspace 3 silent] kitty"
    else
      ""}

    ${if hasPackage "firefox" then
      "exec-once = [workspace 2 silent] firefox"
    else
      ""}

    ${if hasPackage "vscode" then
      "exec-once = [workspace 1 silent] sleep 5; code"
    else
      ""}
  '';
}
