{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.fortivpn.enable =
    lib.mkEnableOption "Enable fortivpn";
  config = lib.mkIf (cfg.desktop.enable && cfg.programs.fortivpn.enable) {
    home.packages = with pkgs; [ openfortivpn openfortivpn-webview-qt ];
  };
}
