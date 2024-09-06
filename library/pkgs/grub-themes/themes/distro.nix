{ pkgs, lib, ... }:

pkgs.stdenv.mkDerivation {
  version = "3.1";
  pname = "grub-custom-distro-theme";
  installPhase = "cp -r customize/nixos $out";

  src = pkgs.fetchFromGitHub {
    rev = "v3.1";
    owner = "AdisonCavani";
    repo = "distro-grub-themes";
    hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
  };

  meta = with lib; {
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
