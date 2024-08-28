{ lib, inputs, outputs, ... }:

with lib;

let
  inherit (inputs) nixpkgs systems;
  myLib = import ./library.nix lib;
  env = import ./environment.nix lib;
  pkgsFor = myLib.pkgsFor { inherit nixpkgs systems; };
  createArgs = host:
    let
      loc = path.append ./. "${host}/environment.nix";
      env = if (pathExists loc) then (env // (import loc lib)) else env;
      myArgs = {
        inherit inputs outputs myLib myArgs;
        myEnv = env // { inherit host; };
      };
    in myArgs;
in {
  inherit mylib;
  hosts = genAttrs (env.hosts) (name:
    nixosSystem {
      modules = [ ../core ];
      specialArgs = createArgs name;
    });

  homes = genAttrs (forEach (env.hosts) (h: "${env.admin.login}@${h}")) (name:
    homeManagerConfiguration rec {
      modules = [ (import ../home true) ]; # Standalone
      extraSpecialArgs = createArgs (last (splitString "@" name));
      pkgs = pkgsFor.${extraSpecialArgs.myEnv.platform};
    });
}
