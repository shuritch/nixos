{ pkgs, lib, ... }:

pkgs.stdenv.mkDerivation {
  name = "grub-custom-fallout-theme";

  src = pkgs.fetchFromGitHub {
    owner = "sashapop10";
    repo = "fallout-grub-theme";
    rev = "b607c1ba65990116b683edce7f2178b7d1b6a48f";
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
