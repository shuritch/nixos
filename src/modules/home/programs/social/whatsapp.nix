{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.whatsapp.enable =
    lib.mkEnableOption "Enable whatsapp.";

  config = lib.mkIf (cfg.desktop.enable && cfg.programs.whatsapp.enable) {
    home.packages = with pkgs; [ whatsapp-for-linux ];
    xdg.configFile."whatsapp-for-linux/setting.conf".text = ''
      [web]
      allow-permissions=true
      hw-accel=1
      min-font-size=16

      [general]
      notification-sounds=true
      close-to-tray=true
      start-in-tray=true
      start-minimized=true
      header-bar=false
      zoom-level=1

      [appearance]
      prefer-dark-theme=true
    '';
  };
}
