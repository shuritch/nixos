{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.zoom.enable = lib.mkEnableOption "Enable zoom.";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.zoom.enable) {
    home.packages = with pkgs; [ zoom-us ];
  };
}
