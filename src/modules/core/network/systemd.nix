{ ... }:

let
in {
  options.my.network = {
    # Doesn't require options
  };

  config = {
    services.resolved.enable = true; # DNS Resolver
    systemd = {
      network.wait-online.enable = false;
      services = {
        NetworkManager-wait-online.enable = false;
        systemd-networkd.stopIfChanged = false;
        systemd-resolved.stopIfChanged = false;
      };
    };
  };
}
