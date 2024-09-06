{ inputs, lib, myArgs, pkgs, myEnv, ... }:

with lib; {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  users.users = genAttrs myEnv.users (_: { packages = [ pkgs.home-manager ]; });
  home-manager.users = genAttrs myEnv.users (_: import ../../home);
  home-manager.extraSpecialArgs = myArgs;
  home-manager.useGlobalPkgs = true;
}
