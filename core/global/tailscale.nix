{ lib, ... }: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = lib.mkDefault "client";
    extraUpFlags = [ ];
  };

  networking.firewall = {
    logReversePathDrops = true;
    allowedUDPPorts = [ 41641 ];
  };
}
