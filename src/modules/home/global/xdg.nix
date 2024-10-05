{ config, lib, pkgs, ... }:

let
  home = config.home.homeDirectory;
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

  config = {
    home.packages = [ pkgs.xdg-utils ];

    xdg = {
      enable = true;
      portal.enable = (builtins.length config.xdg.portal.extraPortals) != 0;
      cacheHome = "${home}/.cache";
      configHome = "${home}/.config";
      dataHome = "${home}/.local/share";
      stateHome = "${home}/.local/state";

      userDirs = {
        enable = true;
        createDirectories = true;
        desktop = "${home}/desktop";
        download = "${home}/downloads";
        music = "${home}/music";
        pictures = "${home}/pictures";
        videos = "${home}/videos";
        documents = "${home}/documents";
        templates = "${home}/templates";
        publicShare = "${home}/share";
        extraConfig = {
          XDG_SCREENSHOTS_DIR = "${home}/screenshots";
          XDG_DEV_DIR = "${home}/dev";
        };
      };

      mimeApps = {
        enable = true;
        defaultApplications = invert cfg.defaultApplications;
        associations.added = invert cfg.addedAssociations;
        associations.removed = invert cfg.removedAssociations;
      };
    };
  };
}
