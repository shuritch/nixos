{ lib, myLib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.mongodb = myLib.mkServiceOption { name = "mongodb"; };
  config = lib.mkIf cfg.mongodb.enable {
    # age.secrets.mongodb-passwd = lib.mkSecret { file = "mongodb-passwd"; };
    services.mongodb = {
      enable = true;
      package = lib.pkgs.mongodb;
      # enableAuth = true;
      # initialRootPassword = config.age.secrets.mongodb-passwd.path;
      # bind_ip = cfg.host;
      extraConfig = ''
        operationProfiling.mode: all
      '';
    };
  };
}
