{ ... }:

let
in {
  imports = [
    # keep-sorted start
    ./docker.nix
    ./podman.nix
    ./postgres.nix
    ./printing.nix
    ./syncthing.nix
    # keep-sorted end
  ];
}
