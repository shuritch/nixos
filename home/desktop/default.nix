{ pkgs, config, ... }: {
  imports = [
    ./discord.nix
    ./kdeconnect.nix
    ./firefox.nix
    ./brave.nix
    ./fonts.nix
    ./gtk.nix
    ./vscode
    ./qt.nix
  ];

  xdg.portal.enable = true;
  services.playerctld = { enable = true; };
  # Also sets org.freedesktop.appearance color-scheme
  dconf.settings."org/gnome/desktop/interface".color-scheme =
    if config.colorscheme.mode == "dark" then
      "prefer-dark"
    else if config.colorscheme.mode == "light" then
      "prefer-light"
    else
      "default";

  home.packages = with pkgs; [
    telegram-desktop
    flameshot
    pkgs.stable.sublime-music # Player
    pavucontrol # Audio control
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
  ];
}
