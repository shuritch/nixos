{ lib, pkgs, config, ... }:

let cfg = config.my.network;
in {
  options.my.network.tailscale = {
    enable = lib.mkEnableOption "Tailscale VPN";
    defaultFlags = lib.mkOption {
      description = "A list of cmd flags that will be passed to the Tailscale";
      type = lib.types.listOf lib.types.str;
      default = [ "--ssh" ];
    };

    isClient = lib.mkOption {
      description = "Tailscale client features.";
      type = lib.types.bool;
      default = true;
    };

    isServer = lib.mkOption {
      description = "Tailscale server features.";
      type = lib.types.bool;
      default = !cfg.tailscale.isClient;
      example = true;
    };
  };

  config = lib.mkIf cfg.tailscale.enable {
    environment.systemPackages = [ pkgs.tailscale ];
    networking.firewall = {
      trustedInterfaces = [ "${config.services.tailscale.interfaceName}" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
      checkReversePath = "loose";
    };

    services.tailscale = {
      enable = true;
      permitCertUid = "root";
      useRoutingFeatures = lib.mkDefault "server";
      extraUpFlags = cfg.tailscale.defaultFlags
        ++ lib.optionals cfg.tailscale.enable [ "--advertise-exit-node" ];
    };

    assertions = [{
      message = "Tailscale can't be both client and server.";
      assertion = cfg.tailscale.isClient == cfg.tailscale.isServer;
    }];
  };
}
