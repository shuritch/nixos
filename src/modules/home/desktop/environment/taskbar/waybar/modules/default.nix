{ lib, config, ... }:

let
  ifGPU = t: l: lib.optionals (lib.hasInfix t config.my.hardware.gpu) l;
  swayOpts = l: lib.optionals config.wayland.windowManager.sway.enable l;
  hyprOpts = l: lib.optionals config.wayland.windowManager.hyprland.enable l;
in {
  imports = [ ./audio.nix ./info.nix ./net.nix ./other.nix ./resources.nix ];
  programs.waybar.settings.primary = {
    modules-left = lib.concatLists [
      (lib.singleton "custom/menu")
      (swayOpts [ "sway/workspaces" "sway/mode" ])
      (hyprOpts [ "hyprland/workspaces" "hyprland/submap" "hyprland/language" ])
      [ "custom/currentplayer" "custom/player" ]
    ];

    modules-center = lib.concatLists [
      (lib.singleton "cpu")
      (ifGPU "nvidia" [ "custom/gpu-nvidia" ])
      (ifGPU "amd" [ "custom/gpu-amd" ])
      [ "memory" "disk" "clock" "pulseaudio" "battery" "bluetooth" ]
    ];

    modules-right = [
      "custom/rfkill"
      "network"
      "tray"
      "custom/hostname"

    ];
  };
}
