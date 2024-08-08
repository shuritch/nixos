{ pkgs, lib, ... }:
let relative = lib.path.append ../../home;
in {
  imports = [ (relative "desktop/hyprland") (relative "default.nix") ];
  wallpaper = pkgs.wallpapers.ship-art-dark;
  monitors = [{ # Integrated monitor
    name = "eDP-1";
    width = 3840;
    height = 2160;
    primary = true;
    workspace = "1";
  }];
}
