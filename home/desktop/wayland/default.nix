{ pkgs, ... }: {
  imports = [
    ./swayidle.nix
    ./swaylock.nix
    ./waypipe.nix
    ./waybar.nix
    ./wofi.nix
    ./mako.nix
  ];

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  services.cliphist.enable = true; # Clip board
  xdg.mimeApps.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_WEBRENDER = 1;
    WLR_RENDERER_ALLOW_SOFTWARE = 1;
    WLR_NO_HARDWARE_CURSORS = 1;
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    LIBSEAT_BACKEND = "logind";
  };

  home.packages = with pkgs; [
    xdragon
    wf-recorder
    wl-clipboard
    networkmanagerapplet
    # Screenshots
    grim
    grimblast
    slurp
    swappy
  ];
}
