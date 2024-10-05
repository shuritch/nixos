{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.rustdesk.enable =
    lib.mkEnableOption "Enable rustdesk";

  config = lib.mkIf (cfg.desktop.enable && cfg.programs.rustdesk.enable) {
    home.packages = with pkgs; [ rustdesk-flutter ];
  };
}
