{ config, lib, myLib, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings.layerrule = [
      "animation fade,hyprpicker"
      "animation fade,selection"
      "animation fade,waybar"
      "blur,waybar"
      "ignorezero,waybar"
      "blur,notifications"
      "ignorezero,notifications"
      "blur,wofi"
      "ignorezero,wofi"
      "noanim,wallpaper"
    ];

    wayland.windowManager.hyprland.settings.animations = {
      enabled = (myLib.isDesktop config);
      first_launch_animation = false;

      bezier = [
        "easein,0.1, 0, 0.5, 0"
        "easeinback,0.35, 0, 0.95, -0.3"
        "easeout,0.5, 1, 0.9, 1"
        "easeoutback,0.35, 1.35, 0.65, 1"
        "easeinout,0.45, 0, 0.55, 1"
      ];

      animation = [
        "fadeIn,1,3,easeout"
        "fadeLayersIn,1,3,easeoutback"
        "layersIn,1,3,easeoutback,slide"
        "windowsIn,1,3,easeoutback,slide"

        "fadeLayersOut,1,3,easeinback"
        "fadeOut,1,3,easein"
        "layersOut,1,3,easeinback,slide"
        "windowsOut,1,3,easeinback,slide"

        "border,1,3,easeout"
        "fadeDim,1,3,easeinout"
        "fadeShadow,1,3,easeinout"
        "fadeSwitch,1,3,easeinout"
        "windowsMove,1,3,easeoutback"
        "workspaces,1,2.6,easeoutback,slide"
      ];
    };
  };
}
