{ inputs, ... }:

let
  addPatches = pkg: patches:
    pkg.overrideAttrs
    (oldAttrs: { patches = (oldAttrs.patches or [ ]) ++ patches; });
in {
  #  aliases 'pkgs.inputs.${flake}'
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };

  # pkgs.stable / inputs.nixpkgs-stable.legacyPackages.${pkgs.system}
  stable = final: _: {
    stable = inputs.nixpkgs-stable.legacyPackages.${final.system};
  };

  # Adds my custom packages
  additions = final: prev: import ../pkgs { pkgs = final; };

  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    wl-clipboard = addPatches prev.wl-clipboard [ ./wl-clipboard-secrets.diff ];
    hyprbars = addPatches prev.hyprbars [ ./hyprbars-color-windowrules.patch ];
    vscode = import ./vscode.nix { inherit final prev; };
    zapret = import ./zapret.nix { inherit final prev; };
  };
}
