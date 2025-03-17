{ lib, myLib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.mongodb = myLib.mkServiceOption { name = "mongodb"; };
  config = lib.mkIf cfg.mongodb.enable {
    services.mongodb = {
      enable = true;
      package = lib.pkgs.mongodb;
      enableAuth = true;
      initialRootPassword = "root";
      extraConfig = ''
        operationProfiling.mode: all
      '';
    };
  };
}
