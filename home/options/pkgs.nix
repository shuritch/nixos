{ pkgs, ... }: {
  home.packages = with pkgs; [
    #? GUI
    hunspell # Dict for libreoffice
    hunspellDicts.ru_RU # Dict for libreoffice
    libreoffice-qt
    pcmanfm-qt # File manager
    obs-studio
    audacity # Audio editor
    kdenlive # Video editor
    mpv # Video player
    imv # Image viewer
    feh # Image viewer
    vlc # Video player

    # Wayland
    #dmenu
    #light
    #makorofi
    #xwayland
    #herbstluftwm
    #seatd
    #polybar

    #? CLI utilities
    scrot # Screen capture
    ffmpeg # Recorder
    lux # Video downloader
    cava # Audio visualization
    yt-dlp # Video downloader
  ];
}
