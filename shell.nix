{ pkgs ? import <nixpkgs> { }, ... }:

let features = "nix-command flakes ca-derivations";
in {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = ${features}";
    nativeBuildInputs = with pkgs; [ nix home-manager gnupg git ];
  };
}
