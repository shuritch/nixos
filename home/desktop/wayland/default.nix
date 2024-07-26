{ pkgs, ... }: {
  imports = [
    ./gammastep.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waypipe.nix
    ./zathura.nix
    ./waybar.nix
    ./wofi.nix
    ./mako.nix
  ];

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  services.cliphist.enable = true; # Clip board
  programs.imv.enable = true; # Image viewer
  xdg.mimeApps.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    MOZ_ENABLE_WAYLAND = 1;
    WLR_NO_HARDWARE_CURSORS = 1;
    QT_QPA_PLATFORM = "wayland";
    LIBSEAT_BACKEND = "logind";
  };

  home.packages = with pkgs; [
    wf-recorder
    wl-clipboard
    # Screenshots
    grim
    grimblast
    slurp
    swappy
  ];
}
