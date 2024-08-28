# Configuration for Admin user declared with environment
{ pkgs, config, myEnv, lib, ... }:

let inherit (builtins) filter hasAttr;
in {
  services.getty.autologinUser = lib.mkDefault myEnv.admin.login;
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users.${myEnv.admin.login} = {
      isNormalUser = true;
      inherit (myEnv.admin) description hashedPassword;
      extraGroups = filter (group: hasAttr group config.users.groups) [
        "audio"
        "deluge"
        "git"
        "i2c"
        "libvirtd"
        "lxd"
        "mysql"
        "network"
        "podman"
        "video"
        "wireshark"
        "docker"
        "minecraft"
        "networkmanager"
        "wheel"
        "input"
        "libvirtd"
        "tpws"
      ];
    };
  };
}
