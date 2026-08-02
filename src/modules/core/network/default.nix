{ ... }:

let
in {
  imports = [
    # keep-sorted start
    ./privacy
    ./security
    ./general.nix
    ./networkmanager.nix
    ./openssh.nix
    ./systemd.nix
    ./tailscale.nix
    ./tcp.nix
    ./wireless.nix
    # keep-sorted end
  ];

}
