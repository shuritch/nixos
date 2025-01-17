{ config, lib, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings.windowrule = [
      "float, ^(rofi)$"
      "float, ^(wofi)$"
      "float, ^(pwvucontrol)$"
      "float, ^(blueman)$"
      "float, ^(nm-connection-editor)$"
      "float, ^(Color Picker)$"
      "float, ^(Network)$"
      "float, ^(xdg-desktop-portal)$"
      "float, ^(xdg-desktop-portal-gnome)$"
      "float, ^(transmission-gtk)$"
    ];

    wayland.windowManager.hyprland.settings.windowrulev2 = [
      "float, title:Picture-in-Picture"
      "float, class:oculante"
      "float, class:download"

      "opacity 0.0 override, class:xwaylandvideobridge"
      "noanim, class:xwaylandvideobridge"
      "noinitialfocus, class:xwaylandvideobridge"
      "maxsize 1 1, class:xwaylandvideobridge"
      "noblur, class:xwaylandvideobridge"

      "size 100% 100%, class:org.kdeconnect.daemon"
      "float, class:org.kdeconnect.daemon"
      "nofocus, class:org.kdeconnect.daemon"
      "noblur, class:org.kdeconnect.daemon"
      "noanim, class:org.kdeconnect.daemon"
      "noshadow, class:org.kdeconnect.daemon"
      "noborder, class:org.kdeconnect.daemon"
      "suppressevent fullscreen, class:org.kdeconnect.daemon"
      "plugin:hyprbars:nobar, class:org.kdeconnect.daemon"
    ];
  };
}
