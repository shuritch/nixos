{ lib, config, pkgs, ... }:

let cfg = config.my.home.desktop;
in {
  imports = [ ./hyprland ];

  options.my.home.desktop = {
    manager = lib.mkOption {
      description = "Choose preferred desktop manager";
      type = lib.types.nullOr (lib.types.enum [ "hyprland" ]);
      default = null;
    };

    isWayland = lib.mkEnableOption "Is desktop manager based on wayland." // {
      default = lib.any (k: k == cfg.manager) [ "hyprland" "sway" "kde" "i3" ];
    };
  };

  config = lib.mkIf (cfg.enable && cfg.isWayland) {
    services.cliphist.enable = true;

    home.packages = with pkgs; [
      xdragon
      wofi-emoji
      wf-recorder
      wl-clipboard
      grim
      grimblast
      slurp
      swappy
    ];

    home.sessionVariables = {
      NIXOS_OZONE_WL = 1;
      MOZ_ENABLE_WAYLAND = 1;
      ANKI_WAYLAND = "1";
      MOZ_WEBRENDER = 1;
      WLR_RENDERER_ALLOW_SOFTWARE = 1;
      WLR_NO_HARDWARE_CURSORS = 1;
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
