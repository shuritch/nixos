{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.slack.enable = lib.mkEnableOption "Enable slack.";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.slack.enable) {
    home.packages = with pkgs; [ slack ];
    xdg.mimeApps.defaultApplications = {
      "x-scheme-handler/slack" = "slack.desktop";
    };
  };
}
