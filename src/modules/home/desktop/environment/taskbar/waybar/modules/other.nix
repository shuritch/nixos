{ myLib, pkgs, lib, config, ... }:

let
  hyprlandCfg = config.wayland.windowManager.hyprland;
  mkScriptJson = myLib.mkWaybarScriptJson pkgs;
  mkScript = myLib.mkWaybarScript pkgs;
in {
  programs.waybar.settings.primary = {
    "custom/menu" = {
      interval = 1;
      return-type = "json";
      exec = mkScriptJson {
        deps = lib.optional hyprlandCfg.enable hyprlandCfg.package;
        text = "";
        tooltip = ''$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)'';
      };

      on-click = if config.programs.wofi.enable then
        mkScript { script = "pkill wofi ; wofi --show drun"; }
      else if config.programs.rofi.enable then
        mkScript { script = "pkill rofi ; rofi -show drun -show-icons"; }
      else
        "false";
    };
  };
}
