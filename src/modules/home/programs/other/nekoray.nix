{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.nekoray.enable = lib.mkEnableOption "Enable nekoray";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.nekoray.enable) {
    home.packages = with pkgs; [ nekoray ];
  };
}
