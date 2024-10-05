{ lib, config, ... }:

let cfg = config.my.security;
in {
  options.my.security.auditd = {
    enable = lib.mkEnableOption "Enable the audit daemon.";
    autoPrune = {
      enable = lib.mkEnableOption "Enable auto-pruning of audit logs." // {
        default = cfg.auditd.enable;
      };

      size = lib.mkOption {
        type = lib.types.int;
        default = 524288000; # 500 MB
        description = "The maximum size of the audit log in bytes.";
      };

      dates = lib.mkOption {
        type = lib.types.str;
        default = "daily";
        example = "weekly";
        description = "How often cleaning is triggered. Passed to systemd.time";
      };
    };
  };

  config = lib.mkIf cfg.auditd.enable {
    security = {
      auditd.enable = true;
      audit = {
        enable = true;
        backlogLimit = 8192;
        failureMode = "printk";
        rules = [ "-a exit,always -F arch=b64 -S execve" ];
      };
    };

    systemd = lib.mkIf cfg.auditd.autoPrune.enable {
      timers."clean-audit-log" = {
        description = "Periodically clean audit log";
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = cfg.auditd.autoPrune.dates;
          Persistent = true;
        };
      };

      services."clean-audit-log" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
        script = ''
          set -eu
          if [[ $(stat -c "%s" /var/log/audit/audit.log) -gt ${
            toString cfg.auditd.autoPrune.size
          } ]]; then
            echo "Clearing Audit Log";
            rm -rvf /var/log/audit/audit.log;
            echo "Done!"
          fi
        '';
      };
    };
  };
}
