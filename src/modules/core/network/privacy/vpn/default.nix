{ lib, config, pkgs, ... }:

let cfg = config.my.network.vpn;
in {
  options.my.network = {
    vpn.enable = lib.mkEnableOption "Enable sing-box VPN.";
  };

  config = lib.mkIf cfg.enable {
    services.sing-box = {
      enable = true;
      package = pkgs.sing-box_1_12;
      settings = { };
    };

    users = {
      groups.sing-box = { };
      users.sing-box = {
        isSystemUser = true;
        group = "sing-box";
      };
    };

    networking.firewall.trustedInterfaces = [ "sing0" ];
    systemd.services.sing-box = {
      environment.PATH = lib.mkForce (lib.makeBinPath [ pkgs.coreutils ]);
    };
  };
}
