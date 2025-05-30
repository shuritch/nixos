{ config, lib, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings.misc = {
      vfr = true;
      close_special_on_empty = true;
      focus_on_activate = true;
      new_window_takes_over_fullscreen = 2; # 0-2
      # disable_hyprland_qtutils_check = true;
      disable_splash_rendering = true;
      disable_hyprland_logo = true; # No startup logo
      force_default_wallpaper = 0; # No anime

      mouse_move_enables_dpms = true; # enable dpms on mouse/touchpad action
      key_press_enables_dpms = true; # enable dpms on keyboard action
      disable_autoreload = true; # autoreload is unnecessary on nixos
    };
  };
}
