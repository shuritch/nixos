{ inputs, outputs, ... }: {
  #  aliases 'pkgs.inputs.${flake}'
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };

  additions = final: _prev: import ../pkgs { pkgs = final; };

  # pkgs.stable / inputs.nixpkgs-stable.legacyPackages.${pkgs.system}
  stable = final: _: {
    stable = inputs.nixpkgs-stable.legacyPackages.${final.system};
  };

  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev:
    {
      # vscode = import ./vscode.nix { inherit final prev; };
    };
}
