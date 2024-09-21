lib:

with lib;
let importers = import ./importers.nix lib;
in importers // rec {
  flake-utils = import ./flake-utils.nix;
  selfRef = name: value: value // { ${name} = value; };
  pfxPaths = pfx: arr: map (path: pfxPath pfx path) arr;
  pfxPath = pfx: p:
    if (isString p && !(hasPrefix "/" p || hasPrefix "." p)) then
      path.append pfx p
    else
      p;
}
