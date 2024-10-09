{ lib, pkgs, ... }: {
  shellcolord = pkgs.stdenv.mkDerivation {
    pname = "shellcolord";
    version = "0.1";
    makeFlags = [ "PREFIX=$(out)" ];
    src = lib.cleanSource ./.;
    meta = with lib; {
      description = "A daemon that themes your shell remotely";
      license = licenses.unlicense;
      platforms = platforms.all;
    };
  };
}
