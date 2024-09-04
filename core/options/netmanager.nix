{
  networking = {
    networkmanager.enable = true;
    dhcpcd.enable = false;
  };

  services.strongswan = {
    enable = true;
    secrets = [ "ipsec.d/ipsec.nm-l2tp.secrets" ];
  };

  systemd.tmpfiles.rules =
    [ "L /etc/ipsec.secrets - - - - /etc/ipsec.d/ipsec.nm-l2tp.secrets" ];
}
