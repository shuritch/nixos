{ pkgs, lib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.distrobox.enable = lib.mkEnableOption "Enable distrobox.";
  config = lib.mkIf cfg.distrobox.enable {
    environment.systemPackages = with pkgs; [ distrobox ];
    systemd.user = lib.mkIf cfg.distrobox.enable {
      timers."distrobox-update" = {
        enable = true;
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnBootSec = "1h";
          OnUnitActiveSec = "1d";
          Unit = "distrobox-update.service";
        };
      };

      services."distrobox-update" = {
        enable = true;
        serviceConfig = { Type = "oneshot"; };
        script = ''
          ${lib.getExe pkgs.distrobox} upgrade --all
        '';
      };
    };

    assertions = [{
      message = "Distrobox requires docker or podman service to be active.";
      assertion = !(config.virtualisation.docker.enable
        || config.virtualisation.podman.enable);
    }];
  };
}
