{ pkgs, lib, config, ... }:

let cfg = config.my.home.desktop;
in {
  options.my.home.desktop = {
    isWayland = lib.mkEnableOption "Is desktop manager based on wayland." // {
      default = lib.any (k: k == cfg.manager) [ "hyprland" ];
    };
  };

  config = lib.mkIf (cfg.enable && cfg.isWayland) {
    services.cliphist.enable = true;
    home.packages = with pkgs; [
      xdragon
      wf-recorder
      wl-clipboard
      grim
      grimblast
      slurp
      swappy
    ];

    xdg.portal = {
      enable = true;
      config.hyprland.default = [ "hyprland" ];
      # config.wlr.default = [ "wlr" "gtk" ];
      # config.common.default = [ "gtk" ];
      extraPortals = with pkgs;
        [
          xdg-desktop-portal-hyprland
          # xdg-desktop-portal-wlr
          # xdg-desktop-portal-gtk
        ];
    };

    xdg.configFile."electron-flags.conf".text = ''
      --enable-features=UseOzonePlatform
      --ozone-platform=wayland
    '';

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      ANKI_WAYLAND = "1";
      MOZ_WEBRENDER = "1";
      # GTK_USE_PORTAL = "1";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_SESSION_TYPE = "wayland";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      LIBSEAT_BACKEND = "logind";
      _JAVA_AWT_WM_NONEREPARENTING = "1";
      GDK_BACKEND = "wayland,x11";
    };
  };
}
