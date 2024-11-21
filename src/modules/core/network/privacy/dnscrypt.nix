{ config, lib, ... }:

let cfg = config.my.network;
in {
  options.my.network.dnscrypt.enable =
    lib.mkEnableOption "Enable dnscrypt-proxy2.";

  config = lib.mkIf cfg.dnscrypt.enable {
    networking = {
      nameservers = [ "127.0.0.1" "::1" ];
      dhcpcd.extraConfig = "nohook resolv.conf";
      networkmanager.dns = "systemd-resolved";
      enableIPv6 = false; # No leaks
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
        server_names = [ "cloudflare" "scaleway-fr" "google" ];
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

    services.resolved = {
      enable = true;
      fallbackDns = [ ];
    };

    systemd.services.dnscrypt-proxy2.serviceConfig = {
      StateDirectory = "dnscrypt-proxy";
    };
  };
}
