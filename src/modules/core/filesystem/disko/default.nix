{ lib, inputs, ... }:

{
  imports = [ inputs.disko.nixosModules.disko ];

  options = {
    my.filesystem.preset = lib.mkOption {
      type = lib.types.nullOr lib.types.enum [ "btrfs" "ext4" ];
      default = null;
    };
  };
}
