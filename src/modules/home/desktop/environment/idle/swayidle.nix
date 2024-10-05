{ pkgs, lib, config, ... }:
let
  pgrep = "${pkgs.procps}/bin/pgrep";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
  swaylock = "${config.programs.swaylock.package}/bin/swaylock";
  hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
  swaymsg = "${config.wayland.windowManager.sway.package}/bin/swaymsg";
  isLocked = "${pgrep} -x ${swaylock}";
  cfg = config.my.home.desktop;
  lockTime = 30 * 60;

  # Makes two timeouts: one for when the screen is not locked (lockTime+timeout) and one for when it is.
  afterLockTimeout = { timeout, command, resumeCommand ? null, }: [
    {
      timeout = lockTime + timeout;
      inherit command resumeCommand;
    }
    {
      command = "${isLocked} && ${command}";
      inherit resumeCommand timeout;
    }
  ];
in {
  config.services.swayidle = lib.mkIf (cfg.enable && cfg.idle == "swayidle") {
    enable = true;
    systemdTarget = "graphical-session.target";
    timeouts = lib.concatLists [
      # Lock screen
      [{
        timeout = lockTime;
        command = "${swaylock} -i ${config.wallpaper} --daemonize";
      }]

      # Mute mic
      (afterLockTimeout {
        timeout = 10;
        command = "${pactl} set-source-mute @DEFAULT_SOURCE@ yes";
        resumeCommand = "${pactl} set-source-mute @DEFAULT_SOURCE@ no";
      })

      # Turn off displays (hyprland)
      (lib.optionals config.wayland.windowManager.hyprland.enable
        (afterLockTimeout {
          timeout = 40;
          command = "${hyprctl} dispatch dpms off";
          resumeCommand = "${hyprctl} dispatch dpms on";
        }))

      # Turn off displays (sway)
      (lib.optionals config.wayland.windowManager.sway.enable
        (afterLockTimeout {
          timeout = 40;
          command = "${swaymsg} 'output * dpms off'";
          resumeCommand = "${swaymsg} 'output * dpms on'";
        }))
    ];
  };
}
