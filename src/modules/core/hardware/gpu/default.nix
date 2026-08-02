{ lib, ... }:

let
in {
  imports = [
    # keep-sorted start
    ./amd.nix
    ./intel.nix
    ./nvidia.nix
    # keep-sorted end
  ];

  options.my.hardware.gpu = lib.mkOption {
    type = with lib.types; nullOr (enum [ "amd" "intel" "nvidia" ]);
    description = "The manufacturer of the primary system gpu.";
    default = null;
  };
}
