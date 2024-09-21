{ pkgs, ... }: {
  imports = [ ./lutris.nix ./steam.nix ./mangohud.nix ];
  home.packages = [ pkgs.gamescope ];
}
