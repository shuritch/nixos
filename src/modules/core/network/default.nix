{ lib, config, ... }:

{
  imports = [
    ./security
    ./privacy
    ./fast-tcp.nix
    ./systemd.nix
    ./openssh.nix
    ./tailscale.nix
    ./networkmanager.nix
    ./wireless.nix
  ];

  networking = {
    # telnet artifactory.top 443 / "127.0.0.53"
    # sudo systemd-resolve --flush-caches / sudo systemctl restart systemd-resolved
    nameservers = [ "172.18.48.218" "172.18.18.40" "127.0.0.1" "::1" ];
    enableIPv6 = lib.mkDefault false; # No leaks
    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "systemd-resolved";
    useNetworkd = lib.mkForce true; # DHCP analog
    useDHCP = lib.mkForce false; # Deprecated ?
    usePredictableInterfaceNames = lib.mkDefault true;
    hostId = builtins.substring 0 8
      (builtins.hashString "md5" config.networking.hostName);
  };

  services.resolved = {
    enable = true;
    fallbackDns = [ "8.8.8.8" "1.1.1.1" ];
    domains = [ "~artifactory.top" ];
  };
}
