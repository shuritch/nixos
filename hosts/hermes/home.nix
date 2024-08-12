{ pkgs, ... }:

{
  imports = [
    ../../home/default.nix
    ../../home/desktop/hyprland
    ../../home/apps
    ../../home/cli
  ];

  wallpaper = pkgs.wallpapers.ship-art-dark;
  monitors = [{ # Integrated monitor
    name = "eDP-1";
    width = 3840;
    height = 2160;
    primary = true;
    workspace = "1";
    scale = 2;
  }];
}
