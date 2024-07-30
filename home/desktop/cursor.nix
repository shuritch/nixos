{ pkgs, ... }: {
  home.pointerCursor = {
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    gtk.enable = true;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = true;
    };
  };
}
