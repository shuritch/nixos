{ lib, config, myLib, ... }: {
  imports = [ ./containers ./databases ./other ];

  services = {
    lvm.enable = lib.mkDefault true; # Logical volume manager
    thermald.enable = true; # Monitor and control temperature
    smartd.enable = true; # Enable disks monitoring
    fwupd = { # Firmware updater for machine hardware
      daemonSettings.EspLocation = config.boot.loader.efi.efiSysMountPoint;
      enable = true;
    };

    # https://wiki.archlinux.org/title/Systemd/Journal#Persistent_journals
    journald.extraConfig = lib.mkIf (config.my.system.class != "server") ''
      SystemMaxUse=100M
      RuntimeMaxUse=50M
      SystemMaxFileSize=50M
    '';
  };

  systemd = let
    extraConfig = ''
      DefaultTimeoutStartSec=15s
      DefaultTimeoutStopSec=15s
      DefaultTimeoutAbortSec=15s
      DefaultDeviceTimeoutSec=15s
    '';
  in {
    user = { inherit extraConfig; };
    inherit extraConfig;

    services = {
      # https://src.fedoraproject.org/rpms/systemd/tree/acb90c49c42276b06375a66c73673ac3510255
      nix-daemon.serviceConfig.OOMScoreAdjust = lib.mkDefault 350;
    } // (lib.optionalAttrs (myLib.testHM config "desktop.enable") {
      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
      "getty@tty7".enable = false;
      "autovt@tty7".enable = false;
      "kmsconvt@tty1".enable = false;
      "kmsconvt@tty7".enable = false;
    });

    oomd = { # Out-Of-Memory Killer
      enable = lib.mkDefault true;
      enableRootSlice = true;
      enableUserSlices = true;
      enableSystemSlice = true;
      extraConfig."DefaultMemoryPressureDurationSec" = "20s";
    };

    tmpfiles.rules = [
      # Enables storing of the kernel log (including stack trace) into pstore upon a panic or crash.
      "w /sys/module/kernel/parameters/crash_kexec_post_notifiers - - - - Y"
      # Enables storing of the kernel log upon a normal shutdown (shutdown, reboot, halt).
      "w /sys/module/printk/parameters/always_kmsg_dump - - - - N"
    ];
  };
}
