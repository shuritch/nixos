{ pkgs, config, ... }: {
  imports =
    [ ./fonts.nix ./gtk.nix ./kdeconnect.nix ./cursor.nix ./qt.nix ./apps ];

  xdg.portal.enable = true;
  services.playerctld = { enable = true; };
  dconf.settings."org/gnome/desktop/interface".color-scheme =
    if config.colorscheme.mode == "dark" then
      "prefer-dark"
    else if config.colorscheme.mode == "light" then
      "prefer-light"
    else
      "default";
}
