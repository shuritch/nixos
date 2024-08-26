{ lib, inputs, outputs, ... }:

let
  inherit (inputs) nixpkgs systems;
  rel = lib.path.append ./.;
  createArgs = extra: { inherit inputs outputs; } // extra;
  envArgs = createArgs { inherit lib; };
  env = import ./environment.nix envArgs;
  hostsXAdmin = lib.forEach (env.hosts) (h: "${env.admin.login}@${h}");
  forSys = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
  pkgsFor = lib.genAttrs (import systems) (system:
    import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    });
in {
  inherit forSys;
  hosts = lib.genAttrs (env.hosts) (host:
    let hostenv = import (rel "${host}/environment.nix") envArgs;
    in lib.nixosSystem {
      specialArgs = createArgs { myEnv = env // hostenv; };
      modules = [ (rel "${host}/configuration.nix") ];
    });

  homes = lib.genAttrs hostsXAdmin (home:
    let
      host = lib.last (lib.splitString "@" home);
      hostenv = import (rel "${host}/environment.nix") envArgs;
    in lib.homeManagerConfiguration {
      modules = [ ../home/standalone.nix (rel "${host}/home.nix") ];
      extraSpecialArgs = createArgs { myEnv = env // hostenv; };
      pkgs = pkgsFor.${hostenv.platform};
    });
}
