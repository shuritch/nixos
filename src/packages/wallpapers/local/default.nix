{ lib, pkgs, ... }:

let
  ext = [ ".jpg" ".png" ".jpeg" ];
  isValidWallpaper = s: lib.any (v: lib.hasSuffix v s) ext;
  papers = lib.filterAttrs (k: _: isValidWallpaper k) (builtins.readDir ./.);
in lib.mapAttrs' (k: _:
  let name = "wallpaper-${lib.head (lib.splitString "." k)}";
  in lib.nameValuePair name (pkgs.stdenv.mkDerivation {
    inherit name;
    buildCommand = "cp ${./.}/${k} $out";
  })) papers
