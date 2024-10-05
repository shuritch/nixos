{ pkgs, lib, config, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings = {
      exec-once = cfg.exec;
      exec = [
        "${pkgs.swaybg}/bin/swaybg -i ${cfg.wallpaper} --mode fill"
        "hyprctl setcursor ${config.gtk.cursorTheme.name} ${
          toString config.gtk.cursorTheme.size
        }"
      ];
    };
  };
}
