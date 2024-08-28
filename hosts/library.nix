lib:

with lib; rec {
  dotNixFromDir = p:
    let
      filter = k: v:
        (k != "default.nix") && ((hasSuffix ".nix" k) || v == "directory");
      dir = filterAttrs (k: _: filter k) (builtins.readDir p);
      files = builtins.attrNames (filterAttrs (_: v: v != "directory") dir);
      parsedFiles = map (v: path.append p v) files;
    in parsedFiles;

  dotNixFromDirRecursive = p:
    let
      filter = k: v:
        (k != "default.nix") && ((hasSuffix ".nix" k) || v == "directory");
      dir = filterAttrs (k: v: filter k v) (builtins.readDir p);
      folders = builtins.attrNames (filterAttrs (_: v: v == "directory") dir);
      files = builtins.attrNames (filterAttrs (_: v: v != "directory") dir);
      parsedFiles = map (v: path.append p v) files;
      parsedFolders = map (v:
        let
          dirPath = path.append p v;
          default = path.append dirPath "default.nix";
          defaultExists = builtins.pathExists default;
        in if defaultExists then default else dotNixFromDirRecursive dirPath)
        folders;
    in (flatten parsedFolders) ++ parsedFiles;

  pfxPaths = pfx: arr: map (path: pfxPath pfx path) arr;
  pfxPath = pfx: p:
    if (isString p && !(hasPrefix "/" p)) then path.append pfx p else p;

  pkgsFor = { systems, nixpkgs }:
    genAttrs (import systems) (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
}
