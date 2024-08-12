{ lib, stdenv, ... }:

let pname = "shellcolord";
in stdenv.mkDerivation {
  inherit pname;
  version = "0.1";
  makeFlags = [ "PREFIX=$(out)" ];
  src = lib.cleanSource ./.;

  meta = with lib; {
    description = "A daemon that themes your shell remotely";
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
