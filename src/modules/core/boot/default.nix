{ ... }:

let
in {
  imports = [
    # keep-sorted start
    ./initrd.nix
    ./kernel.nix
    ./loader.nix
    ./silent-boot.nix
    ./tmp.nix
    # keep-sorted end
  ];
}
