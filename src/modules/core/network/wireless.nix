{ ... }:

let
in {
  options.my.network = {
    # Doesn't require options
  };

  config = { # helps keeping wifi speedy 👇
    hardware.wirelessRegulatoryDatabase = true;
    networking.wireless = {
      userControlled.enable = true;
      allowAuxiliaryImperativeNetworks = true;
      extraConfig = ''
        update_config=1
      '';

      iwd.settings = {
        Settings.AutoConnect = true;
        General = {
          # AddressRandomization = "network";
          # AddressRandomizationRange = "full";
          EnableNetworkConfiguration = true;
          RoamRetryInterval = 15;
        };
      };
    };
  };
}
