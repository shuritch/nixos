{ lib, ... }:

let inherit (lib) mkOption types;
in {
  imports = [ ./amd.nix ./intel.nix ];
  options.my.hardware.cpu = mkOption {
    type = types.nullOr (types.enum [ "intel" "vm-intel" "amd" "vm-amd" ]);
    description = "The manufacturer of the primary system cpu";
    default = null;
  };
}
