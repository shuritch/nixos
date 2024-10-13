{ myLib, pkgs, lib, ... }:

let
  mkScriptJson = myLib.mkWaybarScriptJson pkgs;
  mkScript = myLib.mkWaybarScript pkgs;
in {
  programs.waybar.settings.primary = {
    # Volume control
    pulseaudio = {
      on-click = lib.getExe pkgs.pavucontrol;
      format = "{icon}  {volume}%";
      format-muted = "   0%";
      format-icons = {
        headphone = "󰋋 ";
        headset = "󰋎 ";
        portable = " ";
        default = [ " " " " " " ];
      };
    };

    # Audio source
    "custom/currentplayer" = {
      interval = 2;
      return-type = "json";
      format = "{icon}{}";

      exec = mkScriptJson {
        deps = [ pkgs.playerctl ];
        alt = "$player";
        tooltip = "$player ($count available)";
        text = "$more";
        pre = ''
          player="$(playerctl status -f "{{playerName}}" 2>/dev/null || echo "No player active" | cut -d '.' -f1)"
          count="$(playerctl -l 2>/dev/null | wc -l)"
          if ((count > 1)); then
            more=" +$((count - 1))"
          else
            more=""
          fi
        '';
      };

      format-icons = {
        "No player active" = " ";
        "Celluloid" = "󰎁 ";
        "spotify" = "󰓇 ";
        "ncspot" = "󰓇 ";
        "qutebrowser" = "󰖟 ";
        "firefox" = " ";
        "discord" = " 󰙯 ";
        "sublimemusic" = " ";
        "kdeconnect" = "󰄡 ";
        "chromium" = " ";
      };
    };

    # Audio information
    "custom/player" = {
      return-type = "json";
      interval = 2;
      max-length = 20;
      format = "{icon} {}";
      format-icons = {
        "Playing" = "󰐊";
        "Paused" = "󰏤 ";
        "Stopped" = "󰓛";
      };

      exec-if = mkScript {
        deps = [ pkgs.playerctl ];
        script = "playerctl status 2>/dev/null";
      };

      exec = let
        format = ''
          {"text": "{{title}} - {{artist}}", "alt": "{{status}}", "tooltip": "{{title}} - {{artist}} ({{album}})"}'';
      in mkScript {
        deps = [ pkgs.playerctl ];
        script = "playerctl metadata --format '${format}' 2>/dev/null";
      };

      on-click-middle = mkScript {
        deps = [ pkgs.playerctl ];
        script = "playerctl play-pause";
      };

      on-click-right = mkScript {
        deps = [ pkgs.playerctl ];
        script = "playerctl next";
      };

      on-click = mkScript {
        deps = [ pkgs.playerctl ];
        script = "playerctl prev";
      };
    };
  };
}
