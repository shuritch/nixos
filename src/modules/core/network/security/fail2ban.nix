{ lib, config, ... }:

let cfg = config.my.network;
in {
  options.my.network.fail2ban.enable = lib.mkEnableOption "Enable fail2ban.";
  config.services.fail2ban = lib.mkIf cfg.fail2ban.enable {
    enable = true;
    banaction = "iptables-multiport[blocktype=DROP]";
    maxretry = 7;
    ignoreIP = [ "127.0.0.0/8" "10.0.0.0/8" "192.168.0.0/16" ];
    bantime-increment = {
      enable = true;
      rndtime = "12m";
      overalljails = true;
      multipliers = "4 8 16 32 64 128 256 512 1024 2048";
      maxtime = "192h";
    };

    jails.sshd = lib.mkForce ''
      enabled = true
      mode = aggressive
      port = ${
        lib.concatStringsSep "," (map (toString config.services.openssh.ports))
      }
    '';
  };
}
