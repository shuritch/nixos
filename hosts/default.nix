{ inputs, outputs, lib, pkgsFor, ... }:

with lib;
let
  myLib = import ../library/utils lib;
  environments = import ./environment.nix { inherit lib myLib; };
  createArgs = myEnv: extraEnv:
    let
      myArgs = {
        inherit inputs outputs myLib myArgs;
        myEnv = myEnv // extraEnv;
      };
    in myArgs;
in {
  nixosConfigurations = mapAttrs (_: env:
    nixosSystem {
      modules = [ ../core ];
      specialArgs = createArgs env { };
    }) environments;

  homeConfigurations = foldlAttrs (acc: host: env:
    acc // (if builtins.pathExists (path.append ./. "${host}/home.nix") then
      genAttrs (map (user: "${host}@${user}") env.users) (_:
        homeManagerConfiguration {
          modules = [ ../home ];
          extraSpecialArgs = createArgs env { is-hm-standalone = true; };
          pkgs = pkgsFor.${env.platform};
        })
    else
      { })) { } environments;
}
