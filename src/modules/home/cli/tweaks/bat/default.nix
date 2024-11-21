{ config, lib, pkgs, ... }:

let cfg = config.my.home.cli;
in {
  config.programs.bat = lib.mkIf cfg.enableTweaks {
    themes.myTheme.src = import ./theme.nix { inherit config pkgs; };
    # themes.myTheme.file = "myTheme.tmTheme";
    config.pager = "less -FR";
    config.theme = "myTheme";
    enable = true;
  };
}
