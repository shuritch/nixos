{ lib, config, inputs, pkgs, myExtraArgs, ... }:

let
  cfg = config.my.system.users;
  users = builtins.attrNames (lib.filterAttrs (_: v: v.home != null) cfg);
in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  config = lib.mkIf ((builtins.length users) != 0) {
    users.users = lib.genAttrs users (_: { packages = [ pkgs.home-manager ]; });
    home-manager = {
      users = lib.genAttrs users (login: import ./setup.nix login);
      extraSpecialArgs = myExtraArgs // { osConfig = config; };
      backupFileExtension = "bak";
      useUserPackages = true;
      useGlobalPkgs = true;
      sharedModules = [ ];
      verbose = true;
    };
  };
}
