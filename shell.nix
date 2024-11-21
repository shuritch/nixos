{ pkgs ? import <nixpkgs> { }, ... }:

let
  aids = "auto-allocate-uids cgroups recursive-nix";
  features = "nix-command flakes ca-derivations " + aids;
in {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = ${features}";
    nativeBuildInputs = with pkgs; [
      nix
      gnumake
      ripgrep
      httpie
      git
      curl
      wget
      jq
      nh
    ];
  };
}
