{ lib, config, pkgs, myLib, ... }:

let cfg = config.my.network;
in {
  options.my.network = {
    randomMac = lib.mkEnableOption "Makes unreachable over SSH.";
  };

  config = {
    environment.systemPackages =
      lib.optionals (myLib.testHM config "desktop.enable") [
        pkgs.networkmanagerapplet # provides nm-connection-editor
      ];

    networking.networkmanager = {
      enable = true;
      plugins = lib.mkForce [ pkgs.networkmanager-openvpn ];
      dns = "systemd-resolved"; # 👇 makes unreachable over SSH
      ethernet.macAddress = lib.mkIf cfg.randomMac "random";
      unmanaged = [
        "interface-name:tailscale*"
        "interface-name:br-*"
        "interface-name:rndis*"
        "interface-name:docker*"
        "interface-name:virbr*"
        "interface-name:vboxnet*"
        "interface-name:waydroid*"
        "type:bridge"
      ];

      wifi = {
        backend = cfg.wirelessBackend; # iwd / wpa_supplicant
        # macAddress = "random"; # random mac address on every boot
        scanRandMacAddress = true; # random MAC  during scanning
        powersave = true;
      };
    };

    # Integrated VPN Fix
    services.strongswan = {
      enable = true;
      secrets = [ "ipsec.d/ipsec.nm-l2tp.secrets" ];
    };

    # Integrated VPN Fix
    systemd.tmpfiles.rules =
      [ "L /etc/ipsec.secrets - - - - /etc/ipsec.d/ipsec.nm-l2tp.secrets" ];
  };
}
