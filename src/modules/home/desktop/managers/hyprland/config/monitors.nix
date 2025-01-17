{ config, lib, ... }:

let
  cfg = config.my.home.desktop;
  monitors = config.my.hardware.monitors;
  bar = config.programs.waybar.settings.primary;
  cfgh = config.wayland.windowManager.hyprland.settings;
  gap = cfgh.general.gaps_out - cfgh.general.gaps_in;
  space = lib.mapAttrs (_: toString) {
    top = if (bar.position == "top") then bar.height + gap else 0;
    bottom = if (bar.position == "bottom") then bar.height + gap else 0;
    left = if (bar.position == "left") then bar.width + gap else 0;
    right = if (bar.position == "right") then bar.width + gap else 0;
  };
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings = {
      monitor = [
        ",addreserved,${space.top},${space.bottom},${space.left},${space.right}"
      ] ++ (map ({ width, height, scale, rotate, refreshRate, ... }@m:
        let
          res = "${toString width}x${toString height}@${toString refreshRate}";
          trsfm = if rotate == 0 then "" else ",transform,${toString rotate}";
          pos = "${toString m.x}x${toString m.y}";
        in "${m.name},${
          if m.enabled then
            "${res},${pos},${toString scale}${trsfm}"
          else
            "disable"
        }") config.my.hardware.monitors);

      workspace = let
        withWS = lib.filter (m: m.enabled && m.workspaces != null) monitors;
        rule = m: map (w: "name:${w},monitor:${m.name}") m.workspaces;
      in lib.concatLists (map rule withWS);
    };
  };
}
