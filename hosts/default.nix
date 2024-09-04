{ lib, inputs, outputs, ... }:

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

  pkgsFor = genAttrs (import inputs.systems) (system:
    import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });
in {
  inherit pkgsFor;
  nixosConfigurations = mapAttrs (_: env:
    nixosSystem {
      modules = [ ../core ];
      specialArgs = createArgs env { };
    }) environments;

  homeConfigurations = foldlAttrs (acc: host: env:
    acc // (genAttrs (map (user: "${host}@${user}") env.users) (_:
      homeManagerConfiguration {
        modules = [ ../home ];
        extraSpecialArgs = createArgs env { is-hm-standalone = true; };
        pkgs = pkgsFor.${env.platform};
      }))) { } environments;
}
