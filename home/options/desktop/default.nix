{ config, ... }: {
  imports = [ ./fonts.nix ./gtk.nix ./qt.nix ./xdg.nix ];
  services.playerctld.enable = true;
  dconf.settings."org/gnome/desktop/interface".color-scheme =
    if config.colorscheme.mode == "dark" then
      "prefer-dark"
    else if config.colorscheme.mode == "light" then
      "prefer-light"
    else
      "default";
}
