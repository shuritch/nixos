{ lib, config, pkgs, ... }:

let cfg = config.my.home.desktop;
in {
  imports = [ ./mako.nix ];
  options.my.home.desktop.notifier = lib.mkOption {
    description = "Choose your notification manager";
    type = lib.types.nullOr (lib.types.enum [ "mako" ]);
    default = null;
  };

  config = lib.mkIf (cfg.enable && cfg.notifier != null) {
    home.packages = with pkgs; [ libnotify ];
  };
}
