{ lib, pkgs, ... }:

with lib;
let themes = filterAttrs (_: v: v == "directory") (builtins.readDir ./themes);
in mapAttrs' (k: _:
  nameValuePair "plymouth-custom-${k}-theme" (pkgs.stdenv.mkDerivation {
    meta.platforms = platforms.all;
    pname = "plymouth-custom-${k}-theme";
    src = ./themes/${k};
    version = "1.0";
    installPhase = ''
      mkdir -p $out/share/plymouth/themes
      cp -rT . $out/share/plymouth/themes/${k}
    '';
  })) themes
