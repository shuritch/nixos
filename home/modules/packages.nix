{ pkgs, ... }: {
  programs.bash.enable = true;
  programs.bat = {
    enable = true;
    config.theme = "base16";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [ "--color 16" ];
  };

  home.packages = with pkgs; [
    #? GUI
    hunspell # Dict for libreoffice
    hunspellDicts.ru_RU # Dict for libreoffice
    telegram-desktop
    libreoffice-qt
    pcmanfm-qt # File manager
    obs-studio
    gromit-mpx # Desktop drawing
    audacity # Audio editor
    kdenlive # Video editor
    mpv # Video player
    imv # Image viewer
    feh # Image viewer
    vlc # Video player
    alacritty
    discord
    postman
    obsidian
    zoom-us
    gparted
    pgadmin
    anydesk
    brave
    gimp

    #? CLI utilities
    scrot # Screen capture
    ffmpeg # Recorder
    lux # Video downloader
    cava # Audio visualization
    yt-dlp # Video downloader
    brightnessctl # Brightness mananger

    #? Screen shoting
    flameshot
    grim
    grimblast
    slurp
    swappy

    #? Other
    papirus-nord # Icons
  ];
}
