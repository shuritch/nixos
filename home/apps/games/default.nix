{ pkgs, ... }: {
  imports = [ ./lutris.nix ./steam.nix ];
  home.packages = [ pkgs.gamescope ];
}
