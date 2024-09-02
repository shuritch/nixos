{ inputs, self, ... }:

let
  myLib = import ./library.nix lib;
  lib = inputs.nixpkgs.lib // inputs.home-manager.lib;
  environments = import ./environment.nix { inherit lib myLib; };
  createArgs = myEnv:
    myLib.selfRef "myArgs" {
      inherit inputs myLib myEnv self;
      outputs = self;
    };
in with lib; {
  flake = {
    nixosConfigurations = mapAttrs (_: env:
      nixosSystem {
        modules = [ ../core ];
        specialArgs = createArgs env;
      }) environments;

    homeConfigurations = foldlAttrs (acc: host: env:
      acc // (genAttrs (map (user: "${host}@${user}") env.users) (_:
        homeManagerConfiguration {
          modules = [ ../home ];
          extraSpecialArgs = createArgs env // { is-hm-standalone = true; };
          pkgs = inputs.nixpkgs.legacyPackages.${env.platform};
        }))) { } environments;
  };
}
