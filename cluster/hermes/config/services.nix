input:

let atlas = (import ../../atlas/config/services.nix input);
in {
  my.services = {
    seatd.enable = true;
    printing.enable = true;
    earlyroom.enable = true;
    syncthing = atlas.my.services.syncthing;
  };
}
