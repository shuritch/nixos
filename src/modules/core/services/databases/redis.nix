{ lib, myLib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.redis = myLib.mkServiceOption { name = "redis"; };
  config.services.redis = lib.mkIf cfg.redis.enable {
    vmOverCommit = true;
    servers = { };
  };
}
