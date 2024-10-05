{ config, lib, pkgs, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.explorer == "nemo") {
    home.packages = with pkgs.cinnamon; [
      nemo-with-extensions
      nemo-fileroller
      nemo-emblems
    ];
  };
}
