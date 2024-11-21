{ lib, config, ... }:

let cfg = config.my.network;
in {
  options.my.network.tcpcrypt.enable = lib.mkEnableOption "TCP Encryption.";
  config = lib.mkIf cfg.tcpcrypt.enable {
    networking.tcpcrypt.enable = true;
    users = {
      groups.tcpcryptd = { };
      users.tcpcryptd = {
        group = "tcpcryptd";
        isSystemUser = true;
      };
    };
  };
}
