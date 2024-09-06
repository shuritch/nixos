{ pkgs, lib, ... }:

pkgs.stdenv.mkDerivation {
  name = "grub-custom-fallout-theme";

  src = pkgs.fetchFromGitHub {
    owner = "sashapop10";
    repo = "fallout-grub-theme";
    rev = "f31af75167cf8162dea1f17789aba630b0511f75";
    hash = "sha256-JFckfwquaFGRWRYK0sUaGH6nZ0cG6lvRmVdVw6cybuE=";
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
