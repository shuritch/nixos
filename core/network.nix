{
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "client";
  systemd.network.wait-online.anyInterface = true;
  environment.etc.hosts.mode = "0644";
  networking = {
    firewall = {
      logReversePathDrops = true;
      allowedUDPPorts = [ 41641 ];
    };

    nameservers = [ "127.0.0.1" "::1" ];
    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "systemd-resolved"; # none | systemd-resolved ?
    networkmanager.enable = true;
    dhcpcd.enable = false; # NetManager
    enableIPv6 = false; # No leaks
  };

  services.resolved = {
    enable = true;
    fallbackDns = [ ];
  };

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      block_ipv6 = true;
      require_dnssec = true;
      ipv4_servers = true;
      ipv6_servers = false;
      dnscrypt_servers = true;
      doh_servers = true;
      require_nolog = true;

      listen_addresses = [ "127.0.0.1:53" "[::1]:53" ];
      server_names = [ "scaleway-fr" "google" "yandex" "cloudflare" ];
      sources.public-resolvers = {
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key =
          "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
      };
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };
}
