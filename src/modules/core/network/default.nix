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
    enableIPv6 = lib.mkDefault true;
    useNetworkd = lib.mkForce true; # DHCP analog
    useDHCP = lib.mkForce false; # Deprecated ?
    usePredictableInterfaceNames = lib.mkDefault true;
    hostId = builtins.substring 0 8
      (builtins.hashString "md5" config.networking.hostName);
  };
}
