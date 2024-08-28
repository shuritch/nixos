{ pkgs, myLib, ... }:

with myLib; {
  imports = pfxPaths ../../home/options [ "cli" ];
  wallpaper = pkgs.wallpapers.nixos-blue;
}
