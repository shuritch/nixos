{ lib, config, ... }:

let cfg = config.my.network;
in {
  options.my.network = {
    extraNameservers = lib.mkOption {
      description = "Extra nameservers";
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };

    extraHosts = lib.mkOption {
      description = "Extra nameservers";
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };

    fallbackDns = lib.mkOption {
      description = "List of ips to fallback";
      type = lib.types.listOf lib.types.str;
      default = [ "8.8.8.8" "1.1.1.1" ];
    };

    fallbackDomains = lib.mkOption {
      description = "List of domains to fallback";
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = {
    networking = {
      inherit (cfg) extraHosts;
      nameservers = [ "127.0.0.1" "::1" ] ++ cfg.extraNameservers;
      enableIPv6 = lib.mkDefault true;
      useNetworkd = lib.mkForce true;
      useDHCP = lib.mkForce false;
      usePredictableInterfaceNames = lib.mkDefault true;
      hostId = builtins.substring 0 8
        (builtins.hashString "md5" config.networking.hostName);
    };

    programs = {
      bandwhich.enable = true; # Shows network utilization
    };

    # telnet artifactory.top 443 / "127.0.0.53"
    # sudo systemd-resolve --flush-caches / sudo systemctl restart systemd-resolved
    services.resolved = {
      enable = true;
      fallbackDns = cfg.fallbackDns;
      domains = cfg.fallbackDomains;
    };
  };
}
