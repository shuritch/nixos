{ config, lib, pkgs, inputs, ... }:
let
  inherit (config.my.home.colorscheme) colors;
  cfg = config.my.home.desktop;
in {
  imports = [ ./modules ];
  config = lib.mkIf (cfg.enable && cfg.taskbar == "waybar") {
    systemd.user.services.waybar.Unit = {
      StartLimitBurst = 30; # Let it try to start a few more times
      X-Restart-Triggers = lib.mkForce [ ];
      X-Reload-Triggers = [ # Reload instead of restarting
        "${config.xdg.configFile."waybar/config".source}"
        "${config.xdg.configFile."waybar/style.css".source}"
      ];
    };

    programs.waybar = {
      enable = true;
      systemd.enable = true;
      package = pkgs.waybar.overrideAttrs (o: {
        mesonFlags = (o.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
      });

      settings.primary = {
        exclusive = false;
        passthrough = false;
        position = "bottom";
        height = 40;
        margin-top = 0;
        margin-bottom = 6;
        margin-left = 20;
        margin-right = 20;
      };

      style = let
        inherit (inputs.nix-colors.lib.conversions) hexToRGBString;
        rgb = c: o: "rgba(${hexToRGBString "," (lib.removePrefix "#" c)},${o})";
      in ''
        * {
          font-family: ${cfg.fonts.regular.name}, ${cfg.fonts.monospace.name};
          font-size: ${toString cfg.fonts.regular.size}pt;
          padding: 0;
          margin: 0 0.4em;
        }

        window#waybar {
          padding: 0;
          border-radius: 0.5em;
          background-color: ${rgb colors.surface "0.7"};
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
  };
}
