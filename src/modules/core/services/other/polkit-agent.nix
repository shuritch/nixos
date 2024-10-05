{ pkgs, lib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.polkit-agent.enable =
    lib.mkEnableOption "Enable polkit-agent";

  config.systemd.user.services.polkit-pantheon-authentication-agent-1 =
    lib.mkIf cfg.polkit-agent.enable {
      description = "Pantheon PolicyKit agent";
      serviceConfig = {
        Type = "simple";
        ExecStart =
          "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };

      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
    };
}
