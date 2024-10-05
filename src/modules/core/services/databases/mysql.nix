{ lib, myLib, pkgs, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.mysql = myLib.mkServiceOption { name = "mysql"; };
  config = lib.mkIf cfg.mysql.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
      ensureDatabases = [ "admin" ];
      ensureUsers = [{
        name = "admin";
        ensurePermissions = { "admin.*" = "ALL PRIVILEGES"; };
      }];
    };
  };
}
