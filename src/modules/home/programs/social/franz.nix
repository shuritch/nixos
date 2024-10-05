{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.franz.enable = lib.mkEnableOption "Enable franz.";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.franz.enable) {
    home.packages = with pkgs; [ franz ];
  };
}
