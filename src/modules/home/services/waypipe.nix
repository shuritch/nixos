{ pkgs, lib, config, ... }:

let cfg = config.my.home.services;
in {
  options.my.home.services.waypipe.enable = lib.mkEnableOption "Enable waypipe";
  config = lib.mkIf cfg.waypipe.enable {
    home.packages = [ pkgs.waypipe ];
    systemd.user.services = {
      waypipe-client = {
        Install.WantedBy = [ "graphical-session.target" ];
        Unit.Description = "Runs waypipe on startup to support SSH forwarding";
        Service = {
          ExecStartPre = "${lib.getExe' pkgs.coreutils "mkdir"} %h/.waypipe -p";
          ExecStart = "${
              lib.getExe pkgs.waypipe
            } --socket %h/.waypipe/client.sock client";
          ExecStopPost =
            "${lib.getExe' pkgs.coreutils "rm"} -f %h/.waypipe/client.sock";
        };
      };

      waypipe-server = {
        Unit.Description = "Runs waypipe on startup to support SSH forwarding";
        Install.WantedBy = [ "default.target" ];
        Service = {
          Type = "simple";
          ExecStartPre = "${lib.getExe' pkgs.coreutils "mkdir"} %h/.waypipe -p";
          ExecStart = "${
              lib.getExe pkgs.waypipe
            } --socket %h/.waypipe/server.sock --title-prefix '[%H] ' --login-shell --display wayland-waypipe server -- ${
              lib.getExe' pkgs.coreutils "sleep"
            } infinity";
          ExecStopPost = "${
              lib.getExe' pkgs.coreutils "rm"
            } -f %h/.waypipe/server.sock %t/wayland-waypipe";
        };
      };
    };
  };
}
