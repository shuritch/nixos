{ lib, pkgs, ... }:

let inherit (pkgs) stdenv;
in {
  shellcolord = stdenv.mkDerivation {
    pname = "shellcolord";
    version = "0.1";
    makeFlags = [ "PREFIX=$(out)" ];
    src = lib.cleanSource ./.;
    meta = {
      description = "A daemon that themes your shell remotely";
      license = lib.licenses.unlicense;
      platforms = lib.platforms.all;
    };
  };
}
