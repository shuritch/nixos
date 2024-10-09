{ lib, pkgs, config, ... }:

let defaultApp = type: "${lib.getExe pkgs.handlr} launch ${type}";
in {
  options.my.home.desktop.binds = lib.mkOption {
    description = "List of binds.";
    type = lib.types.attrsOf lib.types.str;
    default = { };
  };

  config = let pactl = lib.getExe' pkgs.pulseaudio "pactl";
  in {
    my.home.desktop.binds = lib.foldl (a: b: a // b) { } [
      {
        # Default apps
        "SUPER+e" = defaultApp "text/plain";
        "SUPER+Return" = defaultApp "x-scheme-handler/terminal";
        "SUPER+b" = defaultApp "x-scheme-handler/https";
        "SUPER+m" = defaultApp "inode/directory";
        "SUPERSHIFT+p" = "poweroff";
        "SUPERSHIFT+r" = "reboot";
        # Special keys
        "+XF86MonBrightnessUp" = "light -A 10";
        "+XF86MonBrightnessDown" = "light -U 10";
        "+XF86AudioRaiseVolume" = "${pactl} set-sink-volume @DEFAULT_SINK@ +5%";
        "+XF86AudioLowerVolume" = "${pactl} set-sink-volume @DEFAULT_SINK@ -5%";
        "+XF86AudioMute" = "${pactl} set-sink-mute @DEFAULT_SINK@ toggle";
        "+XF86AudioMicMute" =
          "${pactl} set-source-mute @DEFAULT_SOURCE@ toggle";
      }

      (let # Screenshotting
        grimblast = lib.getExe pkgs.grimblast;
        tesseract = lib.getExe pkgs.tesseract;
        notify-send = lib.getExe' pkgs.libnotify "notify-send";
      in lib.optionalAttrs (config.my.home.desktop.isWayland) {
        "+Print" = "${grimblast} --notify --freeze copy output";
        "SUPER+Print" = "${grimblast} --notify --freeze copy area";
        "ALT+Print" = # English copy
          "${grimblast} --freeze save area - | ${tesseract} - - | wl-copy && ${notify-send} -t 3000 'OCR result copied to buffer'";
        "ALTSHIFT+Print" = # Russian copy
          "${grimblast} --freeze save area - | ${tesseract} -l rus - - | wl-copy && ${notify-send} -t 3000 'OCR result copied to buffer'";
      })

      (let # Audio actions
        playerctl = lib.getExe' config.services.playerctld.package "playerctl";
        playerctld =
          lib.getExe' config.services.playerctld.package "playerctld";
      in lib.optionalAttrs config.my.hardware.audio {
        "+XF86AudioNext" = "${playerctl} next";
        "+XF86AudioPrev" = "${playerctl} previous";
        "+XF86AudioPlay" = "${playerctl}  play-pause";
        "+XF86AudioStop" = "${playerctl} stop";
        "SHIFT+XF86AudioNext" = "${playerctld} shift";
        "SHIFT+XF86AudioPrev" = "${playerctld} unshift";
        "SHIFT+XF86AudioPlay" = "systemctl --user restart playerctld";
      })

      # Screenlock
      (let swaylock = lib.getExe config.programs.swaylock.package;
      in lib.optionalAttrs config.programs.swaylock.enable {
        "+XF86Launch5" = "${swaylock} -S --grace 2 --grace-no-mouse";
        "+XF86Launch4" = "${swaylock} -S --grace 2 --grace-no-mouse";
        "SUPER+backspace" = "${swaylock} -S --grace 2 --grace-no-mouse";
        "SUPER+l" = "${swaylock} -S --grace 2 --grace-no-mouse";
      })

      # Notifications
      (let makoctl = lib.getExe' config.services.mako.package "makoctl";
      in lib.optionalAttrs config.services.mako.enable {
        "SUPER+w" = "${makoctl} dismiss";
        "SUPERSHIFT+w" = "${makoctl} restore";
      })

      # Launcher
      (let wofi = lib.getExe config.programs.wofi.package;
      in lib.optionalAttrs config.programs.wofi.enable {
        "SUPER+s" = "pkill wofi ; ${wofi} -S drun";
        "SUPER+d" = "pkill wofi ; ${wofi} -S run";
        "ALt+f3" = "pkill wofi ; specialisation | ${wofi} -S dmenu";
        "ALt+f2" = "pkill wofi ; ${lib.getExe pkgs.wofi-emoji}";
        "ALt+f1" = "pkill wofi ; keybinds-menu";
      })
    ];

    home.packages = let
      binds = lib.mapAttrs (k: v: "${k} = ${v}") config.my.home.desktop.binds;
      strbinds = lib.concatStringsSep "\n" (builtins.attrValues binds);
    in (lib.optionals config.programs.wofi.enable [
      (pkgs.writeScriptBin "keybinds-menu" ''
        #!/usr/bin/env bash
        binds=$(echo "${strbinds}" | sed 's/+\([^+]*\)$/ = \1/' | sed 's/^+//g' | sed -r 's/\/nix\/store.*\/bin\///g')
        result=$(echo "$binds" | wofi -S dmenu -W 50% --columns 1)
        wl-copy "$(echo -e "$result" | sed -r 's/.*= //g')"
      '')
    ]);
  };
}
