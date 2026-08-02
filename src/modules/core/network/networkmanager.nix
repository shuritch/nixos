{ lib, config, pkgs, myLib, ... }:

let cfg = config;
in {
  options.my.network = {
    # Doesn't require options
  };

  config = {
    environment.systemPackages =
      lib.optionals (myLib.testHM cfg "desktop.enable") [
        pkgs.networkmanagerapplet # provides nm-connection-editor
      ];

    programs.nm-applet = lib.mkIf (myLib.testHM cfg "desktop.enable") {
      enable = true; # Adds applet to waybar
    };

    networking.networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      unmanaged = [
        "interface-name:tailscale*"
        "interface-name:br-*"
        "interface-name:rndis*"
        "interface-name:docker*"
        "interface-name:virbr*"
        "interface-name:vboxnet*"
        "interface-name:waydroid*"
        "type:bridge"
      ];

      wifi = {
        backend = "iwd"; # iwd / wpa_supplicant
        scanRandMacAddress = true; # random MAC during scanning
        powersave = true;
      };
    };
  };
}
