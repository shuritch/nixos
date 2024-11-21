{ myLib, pkgs, config, ... }:

let
  inherit (config.my.home.colorscheme) colors;
  mkScript = myLib.mkWaybarScript pkgs;
in {
  programs.waybar.settings.primary = {
    "hyprland/workspaces" = { sort-by-number = true; };
    "sway/window" = { max-length = 20; };
    "hyprland/language" = {
      format-en = "US";
      format-ru = "RU";
      tooltip = false;
    };

    clock = {
      interval = 1;
      format = "{:%d/%m     %H:%M}";
      format-alt = "{:%Y-%m-%d     %H:%M:%S %z}";
      on-click-left = "mode";
      tooltip-format = "<tt><small>{calendar}</small></tt>";
      calendar = {
        mode = "month";
        on-scroll = 1;
        format = {
          months = "<span color='${colors.primary}'><b>{}</b></span>";
          days = "<span color='${colors.on_surface}'><b>{}</b></span>";
          weekdays = "<span color='${colors.secondary}'><b>{}</b></span>";
          today = "<span color='${colors.primary}'><b>{}</b></span>";
        };
      };
      actions = {
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
      };
    };

    "custom/rfkill" = {
      interval = 1;
      exec-if = mkScript {
        deps = [ pkgs.util-linux ];
        script = "rfkill | grep '<blocked>'";
      };
    };

    "custom/hostname" = {
      exec = mkScript { script = ''echo "$USER@$HOSTNAME"''; };
      on-click = mkScript { script = "systemctl --user restart waybar"; };
    };
  };
}
