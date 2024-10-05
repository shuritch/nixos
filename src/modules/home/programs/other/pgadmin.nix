{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.pgadmin.enable = lib.mkEnableOption "Enable pgadmin";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.pgadmin.enable) {
    home.packages = with pkgs; [ pgadmin ];
  };
}
