{ config, myEnv, lib, ... }: {
  services.getty.autologinUser = lib.mkDefault myEnv.admin.login;
  users.users.${myEnv.admin.login} = {
    inherit (myEnv.admin) description hashedPassword;
    extraGroups = import ./settings/groups.nix config;
    isNormalUser = true;
  };
}
