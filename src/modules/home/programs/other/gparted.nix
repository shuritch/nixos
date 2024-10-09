{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.gparted.enable = lib.mkEnableOption "Enable GParted";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.gparted.enable) {
    home.packages = with pkgs; [ gparted ntfs3g ];
  };
}
