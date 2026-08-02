{ ... }:

let
in {
  imports = [
    # keep-sorted start
    ./boot
    ./filesystem
    ./hardware
    ./network
    ./security
    ./services
    ./system
    # keep-sorted end
  ];
}
