{ config, pkgs, lib, ... }:
let
  cfg = config.my.home.desktop;
  colors = config.my.home.colorscheme.colors;
  rgb = color: "rgb(${lib.removePrefix "#" color})";
  rgba = color: alpha: "rgba(${lib.removePrefix "#" color}${alpha})";
  hyprbars = (pkgs.hyprlandPlugins.hyprbars.override {
    hyprland = config.wayland.windowManager.hyprland.package;
  }).overrideAttrs (old: {
    postPatch = (old.postPatch or "") + ''
      ${lib.getExe pkgs.gnused} -i '/Initialized successfully/d' main.cpp
    '';
  });
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland = {
      plugins = [ hyprbars ];
      settings = {
        "plugin:hyprbars" = {
          bar_height = 25;
          bar_color = rgba colors.surface "dd";
          "col.text" = rgb colors.primary;
          bar_text_font = config.my.home.desktop.fonts.regular.name;
          bar_text_size = config.my.home.desktop.fonts.regular.size;
          bar_part_of_window = true;
          bar_precedence_over_border = true;
          hyprbars-button = let
            closeAction = "hyprctl dispatch killactive";
            maximizeAction = "hyprctl dispatch fullscreen 1";

            isOnSpecial = ''
              hyprctl activewindow -j | jq -re 'select(.workspace.name == "special")' >/dev/null'';
            moveToSpecial = "hyprctl dispatch movetoworkspacesilent special";
            moveToActive =
              "hyprctl dispatch movetoworkspacesilent name:$(hyprctl -j activeworkspace | jq -re '.name')";
            minimizeAction =
              "${isOnSpecial} && ${moveToActive} || ${moveToSpecial}";
          in [
            "${rgb colors.red},14,,${closeAction}"
            "${rgb colors.yellow},14,,${maximizeAction}"
            "${rgb colors.green},14,,${minimizeAction}"
          ];
        };

        windowrulev2 = [
          "plugin:hyprbars:bar_color ${rgba colors.primary "ee"}, focus:1"
          "plugin:hyprbars:title_color ${rgb colors.on_primary}, focus:1"
        ];
      };
    };
  };
}
