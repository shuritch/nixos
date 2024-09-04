{ pkgs, ... }@input:

let
  wallpapers-and-colorschemes = import ./wallpapers input;
  plymouth-themes = import ./plymouth-themes input;
in wallpapers-and-colorschemes // plymouth-themes // {
  iio-hyprland = pkgs.callPackage ./iio-hyprland { };
  shellcolord = pkgs.callPackage ./shellcolord { };
  hyprbars = pkgs.callPackage ./hyprbars.nix { };
}
