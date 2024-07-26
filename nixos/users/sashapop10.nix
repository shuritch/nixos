{ pkgs, config, ... }:

let
  login = "sashapop10"; # TODO
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  main-user = login;
  services.getty.autologinUser = login;
  home-manager.users.${login} = import ../../../home;
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users.${login} = {
      isNormalUser = true;
      email = "sashapop10@yandex.ru"; # TODO
      description = "Alexander Ivanov"; # TODO
      hashedPassword = # TODO: mkpasswd
        "$y$j9T$Cd4bLOks8pPZ4un7UwGdE/$0G1zqKgCiJpmRaFAFN8MIC5LUpIwbrqq65vgLgYAD30";
      packages = [ pkgs.home-manager ]; # ! Do NOT touch
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
      ];
    };
  };
}
