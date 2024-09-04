{ myLib, pkgs, ... }: {
  imports = myLib.pfxPaths ../../home/options [ "cli" ];
  wallpaper = pkgs.wallpaper-nixos-blue;
}
