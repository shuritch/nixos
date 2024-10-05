{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.gimp.enable = lib.mkEnableOption "Enable gimp";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.gimp.enable) {
    home.packages = with pkgs; [ gimp ];
  };
}
