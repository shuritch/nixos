{ pkgs, config, lib, ... }:

let cfg = config.my.security;
in {
  config.services.displayManager.sddm = lib.mkIf (cfg.login == "sddm") {
    enable = true;
    package = pkgs.kdePackages.sddm; # allow qt6 themes to work
    wayland.enable = true; # run under wayland rather than X11
    settings.General.InputMethod = "";
  };
}
