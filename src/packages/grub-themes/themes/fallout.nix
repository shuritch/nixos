{ lib, pkgs, ... }:

let inherit (pkgs) stdenv fetchFromGitHub;
in {
  grub-custom-fallout-theme = stdenv.mkDerivation {
    name = "grub-custom-fallout-theme";
    src = fetchFromGitHub {
      owner = "shuritch";
      repo = "fallout-grub-theme";
      rev = "b607c1ba65990116b683edce7f2178b7d1b6a48f";
      hash = "sha256-A5YSdKVncshvmPkgRguBcPuQrmZN81Etr+QfnajQpMo=";
    };

    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
    '';

    meta = {
      license = lib.licenses.unlicense;
      platforms = lib.platforms.all;
    };
  };
}
