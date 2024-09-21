{ pkgs, lib, myLib, ... }:

with myLib; {
  imports = pfxPaths ../../home/options [ "desktop/hyprland" "apps" "cli" ];
  wallpaper = pkgs.wallpaper-tropical-paradise;
  monitors = [{ # Integrated monitor
    name = "eDP-1";
    width = 3840;
    height = 2160;
    primary = true;
    workspace = "1";
    scale = 2;
  }];

  wayland.windowManager.hyprland.extraConfig = lib.mkBefore ''
    exec-once = ${pkgs.iio-hyprland}/bin/iio-hyprland
    exec-once = battery-note
  '';
}
