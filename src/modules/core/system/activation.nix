{ config, lib, ... }:

let cfg = config.my.system;
in {
  options.my.system.moveFlake = lib.mkEnableOption "Move flake to $FLAKE";
  config.system = {
    # Move flake if not already moved (only for home directory)
    activationScripts.moveFlake = lib.mkIf cfg.moveFlake {
      text = ''
        mkdir -p ${cfg.flakePath}
        ls ${cfg.flakePath} || cp -r ${../../../../.} ${cfg.flakePath}
      '';
    };

    # Symlink root ssh config to ours
    activationScripts.root-ssh-config.text =
      let dir = "${config.users.users.${cfg.admin}.home}/.ssh";
      in ''
        mkdir -p /root/.ssh
        ln -sf ${dir}/config /root/.ssh/config
        ln -sf ${dir}/known_hosts /root/.ssh/known_hosts
        ln -sf ${dir}/known_hosts /root/.ssh/known_hosts
      '';
  };
}
