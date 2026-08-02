{ lib, config, myLib, ... }:

let
in {
  options.my.system = {
    # Doesn't require options
  };

  config.systemd = {
    settings.Manager = {
      DefaultTimeoutStartSec = "15s";
      DefaultTimeoutStopSec = "15s";
      DefaultTimeoutAbortSec = "15s";
      DefaultDeviceTimeoutSec = "15s";
    };

    user.extraConfig = ''
      DefaultTimeoutStartSec=15s
      DefaultTimeoutStopSec=15s
      DefaultTimeoutAbortSec=15s
      DefaultDeviceTimeoutSec=15s
    '';

    services = {
      "serial-getty@".environment.TERM = "xterm-256color";
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

    tmpfiles.rules = [
      # Enables storing of the kernel log (including stack trace) into pstore upon a panic or crash.
      "w /sys/module/kernel/parameters/crash_kexec_post_notifiers - - - - Y"
      # Enables storing of the kernel log upon a normal shutdown (shutdown, reboot, halt).
      "w /sys/module/printk/parameters/always_kmsg_dump - - - - N"
    ];
  };
}
