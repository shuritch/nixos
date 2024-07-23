{ ... }: {
  import = [ ./cursor.nix ./fonts.nix ./qt.nix ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };
}
