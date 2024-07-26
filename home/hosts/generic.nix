{ pkgs, ... }: {
  imports = [ ../desktop/hyprland ../options/coding.nix ../default.nix ];
  wallpaper = pkgs.wallpapers.windows-dark-purple;
  monitors = [{
    name = "eDP-1";
    width = 1920;
    height = 1080;
    workspace = "1";
    primary = true;
  }];
}
