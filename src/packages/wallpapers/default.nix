{ pkgs, lib, ... }@args:

let
  inherit (import ../../library/colorscheme.nix args)
    generateColorscheme colorSchemeTypes;

  localWallpapers = import ./local args;
  papers = localWallpapers;

  getPaperName = name: lib.last (lib.splitString "wallpaper-" name);
  makeSchemaName = name: "colorscheme-${getPaperName name}";
  schemas = lib.mapAttrs' (n: _:
    let pname = makeSchemaName n;
    in lib.nameValuePair pname (generateColorscheme pkgs pname papers.${n}))
    papers;

in lib.foldl (a: b: a // b) { } [
  papers
  schemas
  { papersDrvs = pkgs.linkFarmFromDrvs "wallpapers" (lib.attrValues papers); }
  {
    colorschemesDrvs = let
      require = drv:
        lib.genAttrs colorSchemeTypes
        (scheme: lib.importJSON "${drv}/${scheme}.json");

      json = pkgs.writeText "colorschemes.json"
        (builtins.toJSON (lib.mapAttrs (_: require) schemas));

    in pkgs.linkFarmFromDrvs "colorschemes"
    (lib.attrValues schemas ++ [ json ]);
  }
]
