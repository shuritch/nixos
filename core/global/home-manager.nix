{ inputs, lib, myArgs, pkgs, myEnv, ... }:

let
  unfiltered = builtins.attrNames (builtins.readDir ../users);
  filtered = lib.filter (k: k != "admin.nix" && k != "default.nix") unfiltered;
  users = filtered ++ [ myEnv.admin.login ];
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  users.users = lib.genAttrs users (_: { packages = [ pkgs.home-manager ]; });
  home-manager.users = lib.genAttrs users (_: import ../../home false);
  home-manager.useGlobalPkgs = true; # Not standalone ️☝️
  home-manager.extraSpecialArgs = myArgs;
}
