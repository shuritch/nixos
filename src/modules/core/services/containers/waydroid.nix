{ lib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.waydroid.enable = lib.mkEnableOption "Enable waydroid.";
  config = lib.mkIf cfg.waydroid.enable {
    virtualisation = {
      waydroid.enable = true;
      lxd.enable = true;
    };
  };
}
