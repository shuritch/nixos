{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.teamspeak.enable =
    lib.mkEnableOption "Enable teamspeak.";

  config = lib.mkIf (cfg.desktop.enable && cfg.programs.teamspeak.enable) {
    home.packages = with pkgs; [ teamspeak5_client ];
  };
}
