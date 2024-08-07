{ config, lib, ... }:

let
  cfg = config.xdg.mimeApps.inverted;
  addMime = desktopNames: mime: attrs:
    attrs // {
      ${mime} = (attrs.${mime} or [ ]) ++ lib.splitString ";" desktopNames;
    };

  invert = lib.attrsets.foldlAttrs (acc: desktopNames: mimes:
    if builtins.isList mimes then
      lib.lists.foldr (addMime desktopNames) acc mimes
    else
      addMime desktopNames mimes acc) { };
in {
  options.xdg.mimeApps.inverted = {
    defaultApplications = lib.mkOption {
      type = lib.types.attrsOf (lib.types.listOf lib.types.str);
      default = { };
    };
    addedAssociations = lib.mkOption {
      type = lib.types.attrsOf (lib.types.listOf lib.types.str);
      default = { };
    };
    removedAssociations = lib.mkOption {
      type = lib.types.attrsOf (lib.types.listOf lib.types.str);
      default = { };
    };
  };

  config.xdg.mimeApps = {
    defaultApplications = invert cfg.defaultApplications;
    associations.added = invert cfg.addedAssociations;
    associations.removed = invert cfg.removedAssociations;
  };
}
