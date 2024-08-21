{ inputs, ... }:

let
  addPatches = pkg: patches:
    pkg.overrideAttrs (attrs: { patches = (attrs.patches or [ ]) ++ patches; });
in {
  additions = final: prev: import ../pkgs { pkgs = final; };
  modifications = final: prev: {
    wl-clipboard = addPatches prev.wl-clipboard [ ./wl-clipboard-secrets.diff ];
    vscode = import ./vscode.nix { inherit final prev; };
    zapret = import ./zapret.nix { inherit final prev; };
    vscode-langservers-extracted =
      import ./vscode-langservers.nix { inherit final prev; };
  };

  # aliases pkgs.stable pkgs.master
  stable = f: _: {
    master = import inputs.nixpkgs-master {
      system = f.system;
      config.allowUnfree = true;
    };
    stable = import inputs.nixpkgs-stable {
      system = f.system;
      config.allowUnfree = true;
    };
  };

  #  aliases 'pkgs.inputs.${flake}'
  flake-inputs = f: _: {
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${f.system} or { };
        packages = (flake.packages or { }).${f.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };
}
