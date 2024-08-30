{ pkgs, myLib, ... }: {
  imports = myLib.pfxPaths ../../home/options [ "cli" ];
  wallpaper = pkgs.wallpapers.nixos-blue;
}
