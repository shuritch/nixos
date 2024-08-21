{ pkgs ? import <nixpkgs> { }, ... }:

let
  inherit (pkgs) callPackage;
  wallpapers_package = import ./wallpapers pkgs;
  wallpapers = wallpapers_package.wallpapers;
  colorschemes_package = import ./colorschemes { inherit pkgs wallpapers; };
in {
  plymouth-spinner-monochrome = callPackage ./plymouth-spinner-monochrome { };
  iio-hyprland = callPackage ./iio-hyprland { };
  shellcolord = callPackage ./shellcolord { };
  hyprbars = callPackage ./hyprbars.nix { }; # Non-resident
} // wallpapers_package // colorschemes_package
