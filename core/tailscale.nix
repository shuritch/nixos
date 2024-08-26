{ lib, ... }: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = lib.mkDefault "client";
    extraUpFlags = [ ];
  };

  systemd.network.wait-online.anyInterface = true;
  environment.etc.hosts.mode = "0644";
  networking.firewall = {
    logReversePathDrops = true;
    allowedUDPPorts = [ 41641 ];
  };
}
