{ ... }:

let
in {
  imports = [
    # keep-sorted start
    ./apparmor.nix
    ./auditd.nix
    ./blacklist.nix
    ./kernel.nix
    ./login.nix
    ./pam.nix
    ./polkit.nix
    ./sudo.nix
    # keep-sorted end
  ];
}
