{ config, lib, ... }:

let
  input = config.my.hardware.input;
  cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings = {
      input = {
        kb_layout = lib.concatStringsSep "," input.keyboard.languages;
        kb_options = input.keyboard.toggle;
        kb_variant = "lang";
        sensitivity = 0; # No modifiers
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };
      };

      gestures = (lib.mkIf input.touchscreen {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = true;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      });

      cursor = {
        inactive_timeout = 4;
        no_hardware_cursors = true;
      };
    };
  };
}
