{ lib, pkgs, config, ... }:

let cfg = config.my.security;
in {
  options.my.security.clamav = { # Antivirus software
    enable = lib.mkEnableOption "Enable ClamAV daemon.";
    daemon = {
      settings = lib.mkOption {
        type = with lib; attrsOf (oneOf [ bool int str (listOf str) ]);
        default = {
          LogFile = "/var/log/clamd.log";
          LogTime = true;
          DetectPUA = true;
          VirusEvent = lib.escapeShellArgs [
            "${pkgs.libnotify}/bin/notify-send"
            "--"
            "ClamAV Virus Scan"
            "Found virus: %v"
          ];
        };

        description = ''
          ClamAV configuration. Refer to <https://linux.die.net/man/5/clamd.conf>,
          for details on supported values.
        '';
      };
    };

    updater = {
      enable = lib.mkEnableOption "ClamAV freshclam updater";

      frequency = lib.mkOption {
        description = "Number of database checks per day.";
        type = lib.types.int;
        default = 12;
      };

      interval = lib.mkOption {
        description = "How often freshclam is invoked.";
        type = lib.types.str;
        default = "hourly";
      };

      settings = lib.mkOption {
        type = with lib; attrsOf (oneOf [ bool int str (listOf str) ]);
        default = { };
        description = ''
          freshclam configuration. Refer to <https://linux.die.net/man/5/freshclam.conf>,
          for details on supported values.
        '';
      };
    };
  };

  config = lib.mkIf cfg.clamav.enable {
    services.clamav = {
      daemon = { enable = true; } // cfg.clamav.daemon;
      updater = { enable = true; } // cfg.clamav.updater;
    };

    systemd = {
      tmpfiles.rules = [ "D /var/lib/clamav 755 clamav clamav" ];

      services = {
        clamav-daemon = {
          serviceConfig = {
            PrivateTmp = lib.mkForce "no";
            PrivateNetwork = lib.mkForce "no";
            Restart = "always";
          };

          # only start clamav when required database files are present
          unitConfig.ConditionPathExistsGlob = [
            "/var/lib/clamav/main.{c[vl]d,inc}"
            "/var/lib/clamav/daily.{c[vl]d,inc}"
          ];
        };

        clamav-init-database = {
          wantedBy = [ "clamav-daemon.service" ];
          before = [ "clamav-daemon.service" ];
          serviceConfig.ExecStart = "systemctl start clamav-freshclam";
          # only start clamav when required database files are NOT present
          unitConfig.ConditionPathExistsGlob = [
            "!/var/lib/clamav/main.{c[vl]d,inc}"
            "!/var/lib/clamav/daily.{c[vl]d,inc}"
          ];
        };

        clamav-freshclam = {
          wants = [ "clamav-daemon.service" ];
          serviceConfig = {
            ExecStart = "${pkgs.coreutils}/bin/echo -en Updating_ClamAV_DB";
            SuccessExitStatus =
              lib.mkForce [ 11 40 50 51 52 53 54 55 56 57 58 59 60 61 62 ];
          };
        };
      };

      timers.clamav-freshclam.timerConfig = {
        RandomizedDelaySec = "60m";
        FixedRandomDelay = true;
        Persistent = true;
      };
    };
  };
}
