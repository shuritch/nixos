{ config, lib, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings.windowrule = [
      "float, bitwarden"
      "float, ^(rofi)$"
      "float, ^(pwvucontrol)$"
      "float, ^(blueman)$"
      "float, ^(nm-connection-editor)$"
      "float, ^(Color Picker)$"
      "float, ^(Network)$"
      "float, ^(xdg-desktop-portal)$"
      "float, ^(xdg-desktop-portal-gnome)$"
      "float, ^(transmission-gtk)$"
      "size 800 600,class:Bitwarden"
    ];

    wayland.windowManager.hyprland.settings.windowrulev2 = let
      xembedsniproxy = "class:^()$,title:^()$,xwayland:1,floating:1";
      sweethome3d-tooltips =
        "title:^(win[0-9])$,class:^(com-eteks-sweethome3d-SweetHome3DBootstrap)$";
      steam = "title:^()$,class:^(steam)$";
      steamGame = "class:^(steam_app_[0-9]*)$";
      kdeconnect-pointer = "class:^(org.kdeconnect.daemon)$";
    in [
      "float, title:^(Picture-in-Picture)$"
      "float, class:^(Viewnior)$"
      "float, class:^(download)$"

      "nofocus, ${sweethome3d-tooltips}"

      "stayfocused, ${steam}"
      "minsize 1 1, ${steam}"
      "immediate, ${steamGame}"

      "noblur, ${xembedsniproxy}"
      "opacity 0, ${xembedsniproxy}"
      "workspace special, ${xembedsniproxy}"
      "noinitialfocus, ${xembedsniproxy}"

      "size 100% 100%, ${kdeconnect-pointer}"
      "float, ${kdeconnect-pointer}"
      "nofocus, ${kdeconnect-pointer}"
      "noblur, ${kdeconnect-pointer}"
      "noanim, ${kdeconnect-pointer}"
      "noshadow, ${kdeconnect-pointer}"
      "noborder, ${kdeconnect-pointer}"
      "suppressevent fullscreen, ${kdeconnect-pointer}"
      "plugin:hyprbars:nobar, ${kdeconnect-pointer}"
    ];
  };
}
