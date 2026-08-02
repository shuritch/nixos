{ ... }:

let
in {
  imports = [
    # keep-sorted start
    ./battery
    ./cpu
    ./gpu
    ./audio.nix
    ./bluetooth.nix
    ./graphics.nix
    ./firmware.nix
    ./input.nix
    ./lid.nix
    ./monitoring.nix
    ./monitors.nix
    ./ram.nix
    ./ssd.nix
    ./thunderbolt.nix
    ./webcam.nix
    # keep-sorted end
  ];
}
