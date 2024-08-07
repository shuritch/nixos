{ pkgs, ... }: {
  imports = [
    ./vscode
    ./chrome.nix
    ./discord.nix
    ./documents.nix
    ./filemanager.nix
    ./firefox.nix
    ./media.nix
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
