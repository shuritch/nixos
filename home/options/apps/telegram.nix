{ pkgs, ... }: {
  home.packages = with pkgs; [ telegram-desktop ];
  xdg.mimeApps.defaultApplications."x-scheme-handler/tg" =
    [ "telegramdesktop.desktop" ];
}
