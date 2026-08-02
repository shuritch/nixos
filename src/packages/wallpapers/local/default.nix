{ lib, pkgs, ... }:

let
  ext = [ ".jpg" ".png" ".jpeg" ];
  isValidWallpaper = val: lib.any (suf: lib.hasSuffix suf val) ext;
  papers = lib.filterAttrs (k: _: isValidWallpaper k) (builtins.readDir ./.);
  mkName = k: "wallpaper-${lib.head (lib.splitString "." k)}";
in lib.mapAttrs' (k: _:
  lib.nameValuePair (mkName k) (pkgs.stdenv.mkDerivation {
    name = mkName k;
    buildCommand = "cp ${./.}/${k} $out";
  })) papers
