{ inputs, ... }:

let
  addPatches = pkg: patches:
    pkg.overrideAttrs (attrs: { patches = (attrs.patches or [ ]) ++ patches; });
in {
  # pkgs.stable / inputs.nixpkgs-stable.legacyPackages.${pkgs.system}
  stable = f: _: { stable = inputs.nixpkgs-stable.legacyPackages.${f.system}; };
  additions = final: prev: import ../pkgs { pkgs = final; };
  modifications = final: prev: {
    wl-clipboard = addPatches prev.wl-clipboard [ ./wl-clipboard-secrets.diff ];
    vscode = import ./vscode.nix { inherit final prev; };
    zapret = import ./zapret.nix { inherit final prev; };
  };

  #  aliases 'pkgs.inputs.${flake}'
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };
}
