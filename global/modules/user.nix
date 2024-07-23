{ pkgs, config, env-config, ... }:

let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  programs.zsh.enable = true;
  services.getty.autologinUser = env-config.user.login;
  environment.variables = env-config.global-environment;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${env-config.user.login} = {
      isNormalUser = true;
      description = env-config.user.name;
      hashedPassword = env-config.user.password;
      packages = with pkgs; [ ]; # Don't touch
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
        "networkmanager"
        "wheel"
        "input"
        "libvirtd"
      ];
    };
  };
}
