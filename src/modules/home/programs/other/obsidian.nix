{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.obsidian.enable =
    lib.mkEnableOption "Enable obsidian";

  config = lib.mkIf (cfg.desktop.enable && cfg.programs.obsidian.enable) {
    home.packages = with pkgs; [ obsidian ];
  };
}
