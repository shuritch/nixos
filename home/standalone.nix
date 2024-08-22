# This file should be included when using hm standalone
{ inputs, outputs, lib, ... }:

let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  nix = {
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    settings = {
      experimental-features = [ "nix-command" "flakes" "ca-derivations" ];
      flake-registry = ""; # Disable global flake registry
      warn-dirty = false;
    };
  };

  home.sessionVariables = {
    NIX_PATH = lib.concatStringsSep ":"
      (lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs);
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages =
        [ "python-2.7.18.8" "electron-25.9.0" "electron-24.8.6" ];
    };
  };
}
