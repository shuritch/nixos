{ lib, config, ... }:

let cfg = config.my.network;
in {
  options.my.network.wirelessBackend = lib.mkOption {
    description = "Backend that will be used for wireless connections.";
    type = lib.types.enum [ "iwd" "wpa_supplicant" ];
    default = "wpa_supplicant"; # iwd is not stable
  };

  config = { # helps keeping wifi speedy 👇
    hardware.wirelessRegulatoryDatabase = true;
    networking.wireless = {
      enable = cfg.wirelessBackend == "wpa_supplicant";
      userControlled.enable = true;
      allowAuxiliaryImperativeNetworks = true;
      extraConfig = ''
        update_config=1
      '';

      iwd = {
        enable = cfg.wirelessBackend == "iwd";
        settings = {
          Settings.AutoConnect = true;
          General = {
            # AddressRandomization = "network";
            # AddressRandomizationRange = "full";
            EnableNetworkConfiguration = true;
            RoamRetryInterval = 15;
          };

          Network = {
            EnableIPv6 = true;
            RoutePriorityOffset = 300;
          };
        };
      };
    };
  };
}
