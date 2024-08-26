{ pkgs ? import <nixpkgs> { }, ... }:

let
  inherit (pkgs) callPackage;
  wallpapers_package = import ./wallpapers pkgs;
  wallpapers = wallpapers_package.wallpapers;
  colorschemes_package = import ./colorschemes { inherit pkgs wallpapers; };
in {
  plymouth-themes = callPackage ./plymouth-themes { };
  iio-hyprland = callPackage ./iio-hyprland { };
  shellcolord = callPackage ./shellcolord { };
  hyprbars = callPackage ./hyprbars.nix { }; # Non-resident
  scripts = import ../scripts { inherit pkgs; };
} // wallpapers_package // colorschemes_package
