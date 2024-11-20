{ pkgs, config, lib, ... }: {
  config = lib.mkIf config.my.home.desktop.enable {
    qt = {
      enable = true;
      platformTheme = {
        name = "gtk3";
        package = [
          (pkgs.stable.libsForQt5.qtstyleplugins.overrideAttrs (o: {
            patches = (o.patches or [ ]) ++ [ ./qtstyleplugins-gtk3-key.patch ];
          }))
          (pkgs.stable.qt6.qtbase)
        ];
      };
    };

    home.sessionVariables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = "1"; # No scaling
      QT_QPA_PLATFORM = lib.mkDefault "wayland;xcb"; # -> Wayland -> xcb
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"; # Disable decorations
      DISABLE_QT5_COMPAT = "0"; # backwards compatible
      CALIBRE_USE_DARK_PALETTE =
        if config.my.home.colorscheme.mode == "dark" then "1" else "0";
    };
  };
}
