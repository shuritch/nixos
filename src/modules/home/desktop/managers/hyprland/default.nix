{ lib, config, pkgs, ... }:
let cfg = config.my.home.desktop;
in {
  imports = [ ./config ./plugins ];
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    home.packages = with pkgs; [ grimblast hyprpicker hyprland-qtutils ];
    wayland.windowManager.hyprland = {
      package = pkgs.hyprland.override { wrapRuntimeDeps = false; };
      xwayland.enable = true;
      enable = true;

      systemd = {
        enable = true;
        variables = [ "--all" ];
        extraCommands = lib.mkBefore [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];
      };

      settings = {
        binds = { movefocus_cycles_fullscreen = false; };
        debug = {
          disable_logs = false;
          enable_stdout_logs = true;
        };

        env = [
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XCURSOR_SIZE,36"
        ];
      };

      # Default Apps & Passthrough
      extraConfig = lib.mkAfter ''
        # Passthrough mode (e.g. for VNC)
        bind=SUPER,P,submap,passthrough
        submap=passthrough
        bind=SUPER,P,submap,reset
        submap=reset
      '';
    };
  };
}
