{ lib, pkgs, ... }@args:

with lib;
let
  colorschemeLib = import ../../library/colorscheme.nix args;
  inherit (colorschemeLib) generateColorscheme colorSchemeTypes;
  localWallpapers = import ./local args;
  papers = localWallpapers;

  getWallpaperName = name: last (splitString "wallpaper-" name);
  mkSchemaName = name: "colorscheme-${getWallpaperName name}";
  mkSchema = n: generateColorscheme pkgs (mkSchemaName n) papers.${n};
  mkSchemas = (n: _: nameValuePair (mkSchemaName n) (mkSchema n));
  schemas = mapAttrs' mkSchemas papers;

  importSchema = drv: scheme: importJSON "${drv}/${scheme}.json";
  getSchemasWithTypes = drv: genAttrs colorSchemeTypes (importSchema drv);
  jsonSchema = (builtins.toJSON (mapAttrs (_: getSchemasWithTypes) schemas));
  colorSchemaDrv = pkgs.writeText "colorschemes.json" jsonSchema;
in foldl (a: b: a // b) { } [
  papers
  schemas
  { papersDrvs = pkgs.linkFarmFromDrvs "wallpapers" (attrValues papers); }
  {
    colorschemesDrvs = pkgs.linkFarmFromDrvs "colorschemes"
      (attrValues schemas ++ [ colorSchemaDrv ]);
  }
]
