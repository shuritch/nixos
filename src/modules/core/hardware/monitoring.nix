{ lib, ... }:

let
in {
  options.my.hardware = {
    # Doesn't require options
  };

  config.services = {
    lvm.enable = lib.mkDefault true; # Logical volume manager
    thermald.enable = true; # Monitor and control temperature
    smartd.enable = true; # Enable disks monitoring
  };
}
