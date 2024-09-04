{ inputs, ... }:

let
  addPatches = pkg: patches:
    pkg.overrideAttrs (attrs: { patches = (attrs.patches or [ ]) ++ patches; });
in {
  additions = final: prev:
    import ../pkgs {
      pkgs = final;
      lib = prev.lib;
    };

  modifications = final: prev: {
    wl-clipboard = addPatches prev.wl-clipboard [ ./wl-clipboard-secrets.diff ];
    obsidian = prev.obsidian.override { electron = final.electron_24; };
    vscode = import ./vscode.nix { inherit final prev; };
    zapret = import ./zapret.nix { inherit final prev; };
    vscode-langservers-extracted =
      import ./vscode-langservers.nix { inherit final prev; };
  };

  # aliases pkgs.stable pkgs.master
  branches = final: prev: {
    master = import inputs.nixpkgs-master {
      system = final.system;
      config.allowUnfree = true;
    };
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  #  aliases 'pkgs.inputs.${flake}'
  flake-inputs = final: prev: {
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };
}
