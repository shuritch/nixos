{ config, lib, ... }:

let cfg = config.my.boot;
in {
  config.boot.loader = lib.mkIf (cfg.loader == "none") {
    systemd-boot.enable = lib.mkForce false;
    grub.enable = lib.mkForce false;
  };
}
