{ lib, pkgs, config, ... }:

let cfg = config.my.services;
in {
  # https://dataswamp.org/~solene/2022-09-28-earlyoom.html
  options.my.services.earlyroom.enable = lib.mkEnableOption "Enable earlyroom";
  config.services = lib.mkIf cfg.earlyroom.enable {
    systembus-notify.enable = lib.mkForce true;
    earlyoom = {
      enable = true;
      enableNotifications = true;
      freeSwapThreshold = 2;
      freeMemThreshold = 2;
      extraArgs = let
        # things that we want to avoid killing
        avoid = lib.concatStringsSep "|" [
          "(h|H)yprland"
          "sway"
          "Xwayland"
          "cryptsetup"
          "dbus-.*"
          "gpg-agent"
          "greetd"
          "ssh-agent"
          ".*qemu-system.*"
          "sddm"
          "sshd"
          "systemd"
          "systemd-.*"
          "wezterm"
          "kitty"
          "bash"
          "zsh"
          "fish"
          "n?vim"
        ];

        # things we want to remove fast
        prefer = lib.concatStringsSep "|" [
          "Web Content"
          "Isolated Web Co"
          "firefox.*"
          "chrom(e|ium).*"
          "electron"
          "dotnet"
          ".*.exe"
          "java.*"
          "pipewire(.*)"
          "nix"
          "npm"
          "node"
          "pipewire(.*)"
        ];
      in [ "-g" "--avoid '(^|/)(${avoid})'" "--prefer '(^|/)(${prefer})'" ];

      # Kill logs
      killHook = pkgs.writeShellScript "earlyoom-kill-hook" ''
        echo "Process $EARLYOOM_NAME ($EARLYOOM_PID) was killed"
      '';
    };
  };
}
