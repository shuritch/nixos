{ config, lib, ... }:

let cfg = config.my.home.cli;
in {
  config.programs.bat = lib.mkIf cfg.enableTweaks {
    themes.custom.src = import ./theme.nix config;
    # themes.custom.file = "custom.tmTheme";
    config.pager = "less -FR";
    config.theme = "custom";
    enable = true;
  };
}
