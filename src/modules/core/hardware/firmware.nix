{ config, ... }:

let
in {
  options.my.hardware = {
    # Doesn't require options
  };

  config = {
    hardware.enableRedistributableFirmware = true;
    services.fwupd = { # Firmware updater for machine hardware
      daemonSettings.EspLocation = config.boot.loader.efi.efiSysMountPoint;
      enable = true;
    };
  };
}
