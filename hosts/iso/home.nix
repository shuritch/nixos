{ pkgs, ... }: {
  imports = [ ../../home/default.nix ../../home/cli ];
  wallpaper = pkgs.wallpapers.nixos-blue;
}
