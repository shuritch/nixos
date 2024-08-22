{ lib, stdenv, logo ? null, ... }:

let themes = builtins.readDir ./themes;
in lib.mapAttrsToList (k: _:
  stdenv.mkDerivation {
    meta = { platforms = lib.platforms.all; };
    pname = "plymouth-${k}-theme";
    src = ./themes/${k};
    version = "1.0";

    buildPhase = lib.optionalString (logo != null) ''
      ln -s ${logo} assets/watermark.png
    '';

    installPhase = ''
      mkdir -p $out/share/plymouth/themes
      cp -rT . $out/share/plymouth/themes/${k}
    '';
  }) themes
