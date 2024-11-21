{ lib, config, pkgs, ... }:

let cfg = config.my.home.services;
in {
  options.my.home.services.xwaylandvideobridge.enable =
    lib.mkEnableOption "Enable xwaylandvideobridge";

  config.systemd.user.services.xwaylandvideobridge =
    lib.mkIf cfg.xwaylandvideobridge.enable {
      Unit.Description = "Tool to make it easy to stream wayland";
      Install.WantedBy = [ "default.target" ];
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.xwaylandvideobridge}/bin/xwaylandvideobridge";
        Restart = "on-failure";
      };
    };
}
