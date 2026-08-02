{ lib, pkgs, ... }:

let inherit (pkgs) stdenv fetchFromGitHub;
in {
  grub-custom-distro-theme = stdenv.mkDerivation {
    name = "grub-custom-distro-theme";
    installPhase = "cp -r customize/nixos $out";
    version = "3.1";

    src = fetchFromGitHub {
      rev = "v3.1";
      owner = "AdisonCavani";
      repo = "distro-grub-themes";
      hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
    };

    meta = {
      license = lib.licenses.unlicense;
      platforms = lib.platforms.all;
    };
  };
}
