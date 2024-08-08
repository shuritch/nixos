{ pkgs, ... }: {
  imports = [ ../desktop/hyprland ../default.nix ];
  wallpaper = pkgs.wallpapers.ship-art-dark;
  monitors = [{
    name = "PnP";
    width = 3840;
    height = 2160;
    primary = true;
    workspace = "1";
    scale = 2;
  }];
}
