{ lib, inputs, ... }@args:

{
  # Self-hosted packages
  additions = final: prev:
    import ../packages ({
      pkgs = final;
      lib = prev.lib;
    } // args);

  # Fixes and modifications
  modifications = final: prev:
    let mod-args = { inherit final prev; } // args;
    in lib.foldl (a: b: a // b) { } [
      (import ./updates/zapret.nix mod-args) # Keeping version
    ];

  # Aliases
  aliases = final: _: {
    # pkgs.master
    master = import inputs.nixpkgs-master {
      config.allowUnfree = true;
      system = final.system;
    };

    # pkgs.stable
    stable = import inputs.nixpkgs-stable {
      config.allowUnfree = true;
      system = final.system;
    };

    # pkgs.inputs
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };
}
