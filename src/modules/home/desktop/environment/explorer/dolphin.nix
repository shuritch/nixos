{ config, lib, pkgs, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.explorer == "dolphin") {
    home.packages = with pkgs; [ kdePackages.dolphin ];
  };
}
