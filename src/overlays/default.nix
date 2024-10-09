{ inputs, lib, ... }@args:

let patch = p: m: p.overrideAttrs (a: { patches = (a.patches or [ ]) ++ m; });
in {
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
      { wl-clipboard = patch prev.wl-clipboard [ ./patches/wl-clip.diff ]; }
      { obsidian = prev.obsidian.override { electron = final.electron_24; }; }
      (import ./updates/vscode.nix mod-args) # Adds support of APC
      (import ./updates/zapret.nix mod-args) # Startup fix
    ];

  # Aliases
  aliases = final: _: {
    # pkgs.master
    master = import inputs.nixpkgs-master {
      system = final.system;
      config.allowUnfree = true;
    };

    # pkgs.stable
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };

    # pkgs.inputs
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };
}
