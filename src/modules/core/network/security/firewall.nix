{ lib, pkgs, config, myLib, ... }:

let cfg = config.my.network;
in {
  options.my.network.firewall = {
    allowPing = lib.mkEnableOption "Allow servers to be pinged.";
    ui = lib.mkEnableOption "Enable opensnitch firewall ui.";
    package = lib.mkOption {
      description = "One of iptables / nftables.";
      type = lib.types.package;
      default = pkgs.iptables;
    };
  };

  config = {
    services.opensnitch.enable = cfg.firewall.ui;
    networking.firewall = {
      enable = true;
      inherit (cfg.firewall) package allowPing;
      checkReversePath = lib.mkForce false; # Don't filter DHCP packets
      logReversePathDrops = true; # Better logs
      logRefusedConnections = false;
      allowedTCPPorts = [ 443 8080 ];
      allowedUDPPorts = [ ];

      # KDE Connect UDP port ranges
      allowedUDPPortRanges =
        lib.mkIf (myLib.testHM config "services.kdeconnect.enable") [{
          from = 1714;
          to = 1764;
        }];

      # KDE Connect TCP port ranges
      allowedTCPPortRanges =
        lib.mkIf (myLib.testHM config "services.kdeconnect.enable") [{
          from = 1714;
          to = 1764;
        }];
    };
  };
}
