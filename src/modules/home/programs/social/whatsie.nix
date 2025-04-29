{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.whatsie.enable =
    lib.mkEnableOption "Enable whatsapp.";

  config = lib.mkIf (cfg.desktop.enable && cfg.programs.whatsie.enable) {
    home.packages = with pkgs.stable; [ whatsie ];
  };
}
