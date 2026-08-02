{ lib, ... }:

let inherit (lib) mkOption types;
in {
  imports = [
    # keep-sorted start
    ./amd.nix
    ./intel.nix
    # keep-sorted end
  ];

  options.my.hardware.cpu = mkOption {
    type = types.nullOr (types.enum [ "intel" "vm-intel" "amd" "vm-amd" ]);
    description = "The manufacturer of the primary system cpu";
    default = null;
  };
}
