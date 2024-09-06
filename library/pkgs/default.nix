{ pkgs, ... }@input:

let
  wallpapers-and-colorschemes = import ./wallpapers input;
  plymouth-themes = import ./plymouth-themes input;
  grub-themes = import ./grub-themes input;
in wallpapers-and-colorschemes // {
  iio-hyprland = pkgs.callPackage ./iio-hyprland { };
  shellcolord = pkgs.callPackage ./shellcolord { };
  hyprbars = pkgs.callPackage ./hyprbars.nix { };
} // grub-themes // plymouth-themes
