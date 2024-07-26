{ stdenv, logo ? null, lib, ... }:
stdenv.mkDerivation {
  meta = { platforms = lib.platforms.all; };
  pname = "plymouth-spinner-monochrome";
  version = "1.0";
  src = ./src;

  buildPhase = lib.optionalString (logo != null) ''
    ln -s ${logo} watermark.png
  '';

  installPhase = ''
    mkdir -p $out/share/plymouth/themes
    cp -rT . $out/share/plymouth/themes/spinner-monochrome
  '';
}
