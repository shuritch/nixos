{ pkgs, lib, ... }:

pkgs.stdenv.mkDerivation {
  name = "grub-custom-fallout-theme";

  src = pkgs.fetchFromGitHub {
    owner = "sashapop10";
    repo = "fallout-grub-theme";
    rev = "f31af75167cf8162dea1f17789aba630b0511f75";
    hash = "sha256-mvb44mFVToZ11V09fTeEQRplabswQhqnkYHH/057wLE=";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';

  meta = with lib; {
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
