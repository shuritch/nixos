{ pkgs, ... }: {
  imports = [
    ./vscode
    ./chrome.nix
    ./discord.nix
    ./documents.nix
    ./filemanager.nix
    ./firefox.nix
    ./kdeconnect.nix
    ./media.nix
    ./telegram.nix
    ./thundebird.nix
  ];

  home.packages = with pkgs; [
    obsidian
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
