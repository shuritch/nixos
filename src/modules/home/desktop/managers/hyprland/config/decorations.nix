{ config, lib, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings.decoration = {
      rounding = 7;

      active_opacity = 1.0;
      inactive_opacity = 0.85;
      fullscreen_opacity = 1.0;

      drop_shadow = true;
      shadow_range = 12;
      shadow_offset = "3 3";
      "col.shadow" = "0x44000000";
      "col.shadow_inactive" = "0x66000000";

      blur = {
        enabled = true;
        size = 4;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = true;
        popups = true;
      };
    };
  };
}
