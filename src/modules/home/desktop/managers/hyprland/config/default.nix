{ config, lib, ... }:

let
  rgba = color: alpha: "rgba(${lib.removePrefix "#" color}${alpha})";
  c = config.my.home.colorscheme.colors;
  cfg = config.my.home.desktop;
in {
  imports = [
    ./animations.nix
    ./binds.nix
    ./decorations.nix
    ./exec.nix
    ./hyprbar.nix
    ./inputs.nix
    ./misc.nix
    ./monitors.nix
    ./windowrules.nix
  ];

  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings = {
      general = {
        gaps_in = 15; # 5
        gaps_out = 20;
        border_size = 2; # 3
        "col.active_border" = rgba c.primary "aa";
        "col.inactive_border" = rgba c.surface "aa";
        allow_tearing = true;
      };

      group = {
        "col.border_active" = rgba c.primary "aa";
        "col.border_inactive" = rgba c.surface "aa";
        groupbar.font_size = 11;
      };

      dwindle = {
        split_width_multiplier = 1.35;
        # preserve_split = true;
        pseudotile = true;
      };
    };
  };
}
