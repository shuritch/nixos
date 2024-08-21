pkgs:

let
  inherit (lib) splitString mapAttrs' attrValues nameValuePair;
  inherit (pkgs) lib stdenv linkFarmFromDrvs;
  inherit (builtins) readDir head;
  inherit (stdenv) mkDerivation;
  data = readDir ./data;
  parseName = name: head (splitString "." name);
  parseFile = name:
    mkDerivation {
      inherit name;
      buildCommand = ''
        cp ${./data}/${name} $out
      '';
    };
in rec {
  wallpapers = mapAttrs' (n: _: nameValuePair (parseName n) (parseFile n)) data;
  wallpapersDerivations = linkFarmFromDrvs "wallpapers" (attrValues wallpapers);
}
