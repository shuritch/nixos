{ lib, stdenv, fetchFromSourcehut, ... }:

let pname = "shellcolord";
in stdenv.mkDerivation {
  inherit pname;
  version = "0.1";
  makeFlags = [ "PREFIX=$(out)" ];

  src = fetchFromSourcehut {
    repo = pname;
    owner = "~misterio";
    rev = "c761072952bba8bdc21b906fdc941b9ae5ac5432";
    sha256 = "sha256-SLMAZy9UxQOA+2YhnryJ5ZvMXOf/Bxv0E8gIbP32XfE=";
  };

  meta = with lib; {
    maintainers = with maintainers; [ misterio77 ];
    description = "A daemon that themes your shell remotely";
    homepage = "https://git.sr.ht/~misterio/shellcolord";
    license = licenses.unlicense;
    platforms = platforms.all;
  };
}
