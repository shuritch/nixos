{ config, lib, ... }:

let cfg = config.my.home.cli;
in {
  config.programs.fd = lib.mkIf cfg.enableTweaks {
    ignores = [ ".git/" "*.bak" ];
    enable = true;
    hidden = true;
  };
}
