{ pkgs, lib, ... }:

let
  icon = "white"; # color | white
  resolution = "1440p"; # 1440p | 1080p
  styles = [ # https://gitlab.com/VandalByte/dedsec-grub-theme
    "brainwash"
    "compact"
    "comments"
    "firewall"
    "fuckery"
    "legion"
    "lovetrap"
    "mashup"
    "reaper"
    "redskull"
    "stalker"
    "spam"
    "spyware"
    "strike"
    "sitedown"
    "trolls"
    "tremor"
    "wannacry"
  ];
in builtins.listToAttrs (map (style: {
  name = "grub-custom-dedsec-${style}-theme";
  value = pkgs.stdenv.mkDerivation {
    name = "grub-custom-dedsec-${style}-theme";

    src = pkgs.fetchFromGitLab {
      owner = "VandalByte";
      repo = "dedsec-grub-theme";
      rev = "f31af75167cf8162dea1f17789aba630b0511f75";
      hash = "sha256-mvb44mFVToZ11V09fTeEQRplabswQhqnkYHH/057wLE=";
    };

    installPhase = ''
      mkdir -p $out
      cp assets/backgrounds/${style}-${resolution}.png $out/background.png
      cp -r assets/icons-${resolution}/${icon}/ $out/icons/
      cp -r assets/fonts/${resolution}/* $out/
      cp -r base/${resolution}/* $out/
    '';

    meta = with lib; {
      license = licenses.unlicense;
      platforms = platforms.all;
    };
  };
}) styles)
