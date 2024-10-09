{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.zapzap.enable =
    lib.mkEnableOption "Enable whatsapp.";

  config = lib.mkIf (cfg.desktop.enable && cfg.programs.zapzap.enable) {
    home.packages = with pkgs; [ zapzap ];
  };
}
