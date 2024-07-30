{ pkgs, ... }: {
  imports =
    [ ./discord.nix ./libreoffice.nix ./firefox.nix ./vscode ./chrome.nix ];

  home.packages = with pkgs; [
    pcmanfm-qt # File manager
    telegram-desktop
    # flameshot #? Broken
    gromit-mpx # Desktop drawing
    playerctl # Player
    obsidian # Nothion
    deluge # Torrent
    gimp # Paint
    zoom-us
    xdragon
    gparted
    anydesk
    pgadmin
    postman
    feh # Imager viewer
    imv # Image viewer
    vlc # Video player
    mpv # Video player
    cava # Audio vis
  ];
}
