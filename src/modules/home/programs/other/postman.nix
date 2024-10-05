{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.postman.enable = lib.mkEnableOption "Enable postman";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.postman.enable) {
    home.packages = with pkgs; [ postman ];
  };
}
