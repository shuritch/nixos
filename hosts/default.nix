{ lib, inputs, outputs, ... }:

with lib;

let
  inherit (inputs) nixpkgs systems;
  myLib = import ./library.nix lib;
  environments = import ./environment.nix lib;
  pkgsFor = myLib.pkgsFor { inherit nixpkgs systems; };
  createArgs = myEnv: extraEnv:
    let
      myArgs = {
        inherit inputs outputs myLib myArgs;
        myEnv = myEnv // extraEnv;
      };
    in myArgs;
in {
  inherit mylib;
  hosts = mapAttrs (_: env:
    nixosSystem {
      modules = [ ../core ];
      specialArgs = createArgs env { };
    }) environments;

  homes = foldlAttrs (acc: host: env:
    acc // (genAttrs (map (user: "${host}@${user}") env.users) (_:
      homeManagerConfiguration {
        modules = [ ../home ];
        extraSpecialArgs = createArgs env { is-hm-standalone = true; };
        pkgs = pkgsFor.${env.platform};
      }))) { } environments;
}
