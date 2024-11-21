{ config, lib, ... }:

let cfg = config.my.home.cli;
in {
  config.programs.tealdeer = lib.mkIf cfg.enableTweaks {
    enable = true;
    settings = {
      updates.auto_update = false;
      display = {
        compact = false;
        use_pager = true;
      };
    };
  };
}
