{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.insomnia.enable =
    lib.mkEnableOption "Enable insomnia";

  config = lib.mkIf (cfg.desktop.enable && cfg.programs.insomnia.enable) {
    home.packages = with pkgs; [ insomnia ];
  };
}
