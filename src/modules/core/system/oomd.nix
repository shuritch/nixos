{ lib, config, pkgs, myLib, ... }:

let cfg = config;
in {
  options.my.system = {
    # Doesn't require options
  };

  config = let
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
  in {
    systemd = {
      services = {
        nix-daemon.serviceConfig.OOMScoreAdjust = lib.mkDefault 350;
      };

      oomd = { # Out-Of-Memory Killer
        enable = lib.mkDefault true;
        enableRootSlice = true;
        enableUserSlices = true;
        enableSystemSlice = true;
        extraConfig."DefaultMemoryPressureDurationSec" = "20s";
      };
    };

    services = lib.mkIf (myLib.testHM cfg "desktop.enable") {
      systembus-notify.enable = lib.mkForce true;
      earlyoom = {
        enable = true;
        enableNotifications = true;

        reportInterval = 0;
        freeSwapThreshold = 5;
        freeSwapKillThreshold = 2;
        freeMemThreshold = 5;
        freeMemKillThreshold = 2;

        extraArgs =
          [ "-g" "--avoid" "'^(${avoid})$'" "--prefer" "'^(${prefer})$'" ];

        # Kill logs
        killHook = pkgs.writeShellScript "earlyoom-kill-hook" ''
          echo "Process $EARLYOOM_NAME ($EARLYOOM_PID) was killed"
        '';
      };
    };
  };
}
