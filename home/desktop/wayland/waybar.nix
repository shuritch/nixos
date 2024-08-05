{ config, lib, pkgs, inputs, ... }:
let
  swayCfg = config.wayland.windowManager.sway;
  hyprlandCfg = config.wayland.windowManager.hyprland;
  commonDeps = with pkgs; [ coreutils gnugrep systemd ];
  # Function to simplify making waybar outputs
  mkScript = { name ? "script", deps ? [ ], script ? "", }:
    lib.getExe (pkgs.writeShellApplication {
      inherit name;
      text = script;
      runtimeInputs = commonDeps ++ deps;
    });

  # Specialized for JSON outputs
  mkScriptJson = { name ? "script", deps ? [ ], pre ? "", text ? ""
    , tooltip ? "", alt ? "", class ? "", percentage ? "", }:
    mkScript {
      inherit name;
      deps = [ pkgs.jq ] ++ deps;
      script = ''
        ${pre}
        jq -cn \
          --arg text "${text}" \
          --arg tooltip "${tooltip}" \
          --arg alt "${alt}" \
          --arg class "${class}" \
          --arg percentage "${percentage}" \
          '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
      '';
    };
in {
  # Let it try to start a few more times
  systemd.user.services.waybar = { Unit.StartLimitBurst = 30; };
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
    });

    settings = {
      primary = {
        exclusive = false;
        passthrough = false;
        height = 40;
        margin = "6";
        position = "bottom";
        modules-left = [ "custom/menu" ]
          ++ (lib.optionals swayCfg.enable [ "sway/workspaces" "sway/mode" ])
          ++ (lib.optionals hyprlandCfg.enable [
            "hyprland/workspaces"
            "hyprland/submap"
            "hyprland/language"
          ]) ++ [ "custom/currentplayer" "custom/player" ];

        modules-center =
          [ "cpu" "custom/gpu" "memory" "disk" "clock" "pulseaudio" "battery" ];

        modules-right =
          [ "custom/rfkill" "bluetooth" "network" "tray" "custom/hostname" ];

        "hyprland/language" = {
          format-en = "US";
          format-ru = "RU";
          tooltip = false;
        };

        clock = {
          interval = 1;
          format = "{:%d/%m %H:%M:%S}";
          format-alt = "{:%Y-%m-%d %H:%M:%S %z}";
          on-click-left = "mode";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        cpu = { format = "   {usage}%"; };

        "custom/gpu" = {
          interval = 30;
          exec = mkScript {
            script = "cat /sys/class/drm/card0/device/gpu_busy_percent";
          };
          format = "󰒋   {}%";
        };

        memory = {
          format = "   {}%";
          interval = 30;
        };

        disk = {
          interval = 30;
          format = "󰋊   {percentage_used}%";
          tooltip-format =
            "({used}/{total})({percentage_used}%) in '{path}', available {free}({percentage_free}%)";
        };

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

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰒳";
            deactivated = "󰒲";
          };
        };

        battery = {
          bat = "BAT0";
          interval = 10;
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          onclick = "";
        };

        "sway/window" = { max-length = 20; };

        network = {
          interval = 3;
          max-length = 20;
          format-wifi = "    {essid}";
          format-ethernet = "󰈁   Connected";
          format-disconnected = "";
          on-click = "nm-connection-editor";
          tooltip-format = ''
            {ifname}
            {ipaddr}/{cidr}
            Up: {bandwidthUpBits}
            Down: {bandwidthDownBits}'';
        };

        bluetooth = {
          format = "󰂯";
          max-length = 35;
          on-click = "blueman-manager";
          format-disabled = "󰂲";
          format-connected = "󰂱   {device_alias}";
          format-connected-battery =
            "󰂱   {device_alias} (󰥉 {device_battery_percentage}%)";
          # "format-device-preference": [ "device1", "device2" ], # preference list deciding the displayed device

          tooltip-format-disabled = "bluetooth off";
          tooltip-format = ''
            {controller_alias}	{controller_address} ({status})

            {num_connections} connected'';

          tooltip-format-connected = ''
            {controller_alias}	{controller_address} ({status})

            {num_connections} connected

            {device_enumerate}'';

          tooltip-format-enumerate-connected =
            "{device_alias}	{device_address}";

          tooltip-format-enumerate-connected-battery =
            "{device_alias}	{device_address}	({device_battery_percentage}%)";
        };

        "custom/menu" = {
          interval = 1;
          return-type = "json";
          exec = mkScriptJson {
            deps = lib.optional hyprlandCfg.enable hyprlandCfg.package;
            text = "";
            tooltip = ''$(grep /etc/os-release PRETTY_NAME | cut -d '"' -f2)'';
            class = let
              isFullScreen = if hyprlandCfg.enable then
                "hyprctl activewindow -j | jq -e '.fullscreen' &>/dev/null"
              else
                "false";
            in "$(if ${isFullScreen}; then echo fullscreen; fi)";
          };
        };

        "custom/hostname" = {
          exec = mkScript { script = ''echo "$USER@$HOSTNAME"''; };
          on-click = mkScript { script = "systemctl --user restart waybar"; };
        };

        "custom/currentplayer" = {
          interval = 2;
          return-type = "json";
          format = "{icon}{}";

          exec = mkScriptJson {
            deps = [ pkgs.playerctl ];
            pre = ''
              player="$(playerctl status -f "{{playerName}}" 2>/dev/null || echo "No player active" | cut -d '.' -f1)"
              count="$(playerctl -l 2>/dev/null | wc -l)"
              if ((count > 1)); then
                more=" +$((count - 1))"
              else
                more=""
              fi
            '';
            alt = "$player";
            tooltip = "$player ($count available)";
            text = "$more";
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

        "custom/rfkill" = {
          interval = 1;
          exec-if = mkScript {
            deps = [ pkgs.util-linux ];
            script = "rfkill | grep '<blocked>'";
          };
        };

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
    };

    style = let
      inherit (inputs.nix-colors.lib.conversions) hexToRGBString;
      inherit (config.colorscheme) colors;
      toRGBA = color: opacity:
        "rgba(${hexToRGBString "," (lib.removePrefix "#" color)},${opacity})";
    in ''
      * {
        font-family: ${config.fontProfiles.regular.family}, ${config.fontProfiles.monospace.family};
        font-size: 12pt;
        padding: 0;
        margin: 0 0.4em;
      }

      window#waybar {
        padding: 0;
        border-radius: 0.5em;
        background-color: ${toRGBA colors.surface "0.7"};
        color: ${colors.on_surface};
      }

      .modules-left {
        margin-left: -0.65em;
      }

      .modules-right {
        margin-right: -0.65em;
      }

      #workspaces button {
        background-color: ${colors.surface};
        color: ${colors.on_surface};
        padding-left: 0.4em;
        padding-right: 0.4em;
        margin-top: 0.15em;
        margin-bottom: 0.15em;
      }

      #workspaces button.hidden {
        background-color: ${colors.surface};
        color: ${colors.on_surface_variant};
      }

      #workspaces button.focused,
      #workspaces button.active {
        background-color: ${colors.primary};
        color: ${colors.on_primary};
      }

      #clock {
        padding-right: 1em;
        padding-left: 1em;
        border-radius: 0.5em;
      }

      #custom-menu {
        background-color: ${colors.surface_container};
        color: ${colors.primary};
        padding-right: 1.5em;
        padding-left: 1em;
        margin-right: 0;
        border-radius: 0.5em;
      }

      #custom-menu.fullscreen {
        background-color: ${colors.primary};
        color: ${colors.on_primary};
      }

      #custom-hostname {
        background-color: ${colors.surface_container};
        color: ${colors.primary};
        padding-right: 1em;
        padding-left: 1em;
        margin-left: 0;
        border-radius: 0.5em;
      }

      #custom-currentplayer {
        padding-right: 0;
      }

      #tray {
        color: ${colors.on_surface};
      }

      #custom-gpu, #cpu, #memory {
        margin-left: 0.05em;
        margin-right: 0.55em;
      }
    '';
  };
}
