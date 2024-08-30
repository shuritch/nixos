{ config, lib, myEnv, ... }: {
  services.getty.autologinUser = lib.mkDefault myEnv.admin.login;
  users.users.${myEnv.admin.login} = {
    inherit (myEnv.admin) hashedPassword description;
    extraGroups = import ./settings/groups.nix config;
    isNormalUser = true;
  };
}
