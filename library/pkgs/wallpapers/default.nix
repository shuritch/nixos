{ pkgs, lib, ... }:

with lib;

let
  inherit (builtins) readDir head;
  inherit (pkgs.stdenv) mkDerivation;
  data = readDir ./data;
  paperName = name: "wallpaper-${head (splitString "." name)}";
  schemeName = name: "colorscheme-${head (splitString "." name)}";
  parseScheme = name: generate name wallpapers.${paperName name};
  parseFile = name:
    mkDerivation {
      inherit name;
      buildCommand = "cp ${./data}/${name} $out";
    };

  generate = import ../../utils/colorscheme-generator.nix pkgs;
  wallpapers = mapAttrs' (n: _: nameValuePair (paperName n) (parseFile n)) data;
  schemes = mapAttrs' (n: _: nameValuePair (schemeName n) (parseScheme n)) data;
in wallpapers // schemes // {
  wallpapersDrvs = pkgs.linkFarmFromDrvs "wallpapers" (attrValues wallpapers);
  colorschemesDrvs = let
    combined = pkgs.writeText "colorschemes.json"
      (builtins.toJSON (mapAttrs (_: drv: drv.imported) schemes));
  in pkgs.linkFarmFromDrvs "colorschemes" (attrValues schemes ++ [ combined ]);
}
