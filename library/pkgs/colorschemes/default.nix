{ pkgs, wallpapers }:

let
  inherit (pkgs) lib linkFarmFromDrvs writeText;
  inherit (lib) mapAttrs attrValues;
  inherit (builtins) toJSON;
  generate = import ./generator.nix pkgs;
in rec {
  generateColorscheme = generate;
  colorschemes = mapAttrs (_: v: generate v.name v) wallpapers;
  colorschemesDerivations = let
    combined = writeText "colorschemes.json"
      (toJSON (mapAttrs (_: drv: drv.imported) colorschemes));
  in linkFarmFromDrvs "colorschemes" (attrValues colorschemes ++ [ combined ]);
}
