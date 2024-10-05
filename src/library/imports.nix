{ lib, ... }:

with lib; rec {
  filterNixFiles = k: v: v == "regular" && hasSuffix ".nix" k;
  filterNixFilesAndDirs = k: v: (filterNixFiles k v) || v == "directory";
  filterFiles = k: v: v == "regular";
  filterDirs = k: v: v == "directory";

  groupAttrsByValue = v:
    foldlAttrs
    (acc: name: value: acc // { ${value} = (acc.${value} or [ ]) ++ [ name ]; })
    { } v;

  pullNixPaths = p:
    let
      dir = (filterAttrs (k: _: filter k) (builtins.readDir p));
      filter = k: v: (filterNixFiles k v) && (k != "default.nix");
    in map (v: path.append p v) (builtins.attrNames dir);

  pullNixPathsRecursive = p:
    let
      filter = k: v: (filterNixFilesAndDirs k v) (k != "default.nix");
      dir = filterAttrs (k: v: filter k v) (builtins.readDir p);
      sorted = groupAttrsByValue dir;
      parsedFiles = map (v: path.append p v) sorted.regular;
      parsedFolders = map (v:
        let
          dirPath = path.append p v;
          default = path.append dirPath "default.nix";
          defaultExists = builtins.pathExists default;
        in if defaultExists then default else pullNixPathsRecursive dirPath)
        sorted.directory;
    in (flatten parsedFolders) ++ parsedFiles;
}
