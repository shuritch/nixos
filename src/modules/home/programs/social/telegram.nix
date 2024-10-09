{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.telegram.enable =
    lib.mkEnableOption "Enable telegram.";

  config = lib.mkIf (cfg.desktop.enable && cfg.programs.telegram.enable) {
    home.packages = with pkgs; [ telegram-desktop ];
    xdg.mimeApps.defaultApplications."x-scheme-handler/tg" =
      [ "telegramdesktop.desktop" ];
  };
}
