{ lib, config, myLib, ... }:

let cfg = config;
in {
  options.my.network = {
    # Doesn't require options
  };

  config.networking = {
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
      allowedUDPPortRanges = [ ];
      allowedTCPPortRanges = [ ];
      allowPing = myLib.isServer cfg;
      logReversePathDrops = true; # Better logs
      logRefusedConnections = false;
      checkReversePath = lib.mkForce false; # Don't filter DHCP packets
    };
  };
}
