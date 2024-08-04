{ pkgs, ... }: {
  imports = [
    ./discord.nix
    ./libreoffice.nix
    ./firefox.nix
    ./vscode
    ./chrome.nix

  ];

  home.packages = with pkgs; [
    # obsidian #TODO: Fix drivers
    telegram-desktop
    gromit-mpx # Desktop drawing
    playerctl # Player
    deluge # Torrent
    gimp # Paint
    zoom-us
    gparted
    anydesk
    pgadmin
    postman
    cava # Audio vis
  ];
}
