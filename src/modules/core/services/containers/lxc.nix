{ pkgs, lib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.lxc.enable = lib.mkEnableOption "Enable lxc.";
  config = lib.mkIf cfg.lxc.enable {
    virtualisation = {
      lxd.enable = true;
      lxc = {
        enable = true;
        lxcfs.enable = true;
        defaultConfig = ''
          lxc.include = ${pkgs.lxcfs}/share/lxc/config/common.conf.d/00-lxcfs.conf
        '';
      };
    };
  };
}
