{ pkgs, lib, config, ... }:

let cfg = config.my.home.services;
in {
  options.my.home.services.polkit-agent.enable =
    lib.mkEnableOption "Enable polkit-agent";

  config.systemd.user.services.polkit-pantheon-authentication-agent-1 =
    lib.mkIf cfg.polkit-agent.enable {
      Install.WantedBy = [ "graphical-session.target" ];
      Unit.Description = "Pantheon PolicyKit agent";

      Service = {
        Type = "simple";
        ExecStart =
          "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit";
        Restart = "on-failure";
        TimeoutStopSec = 10;
        RestartSec = 1;
      };
    };
}
