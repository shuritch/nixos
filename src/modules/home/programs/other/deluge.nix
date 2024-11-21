{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.deluge.enable = lib.mkEnableOption "Enable deluge";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.deluge.enable) {
    home.packages = with pkgs; [ deluge ];
  };
}
