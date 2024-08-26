{ pkgs, config, myEnv, lib, ... }:

let
  inherit (myEnv.admin) login password description;
  inherit (config.networking) hostName;
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  services.getty.autologinUser = lib.mkDefault login;
  home-manager.users.${login} = import ../../hosts/${hostName}/home.nix;
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users.${login} = {
      isNormalUser = true;
      description = description;
      hashedPassword = password;
      packages = [ pkgs.home-manager ];
      extraGroups = ifTheyExist [
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
