{ pkgs, lib, ... }: {
  grub-custom-fallout-theme = pkgs.stdenv.mkDerivation {
    name = "grub-custom-fallout-theme";
    src = pkgs.fetchFromGitHub {
      owner = "shuritch";
      repo = "fallout-grub-theme";
      rev = "b607c1ba65990116b683edce7f2178b7d1b6a48f";
      hash = "sha256-A5YSdKVncshvmPkgRguBcPuQrmZN81Etr+QfnajQpMo=";
    };

    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
    '';

    meta = with lib; {
      license = licenses.unlicense;
      platforms = platforms.all;
    };
  };
}
