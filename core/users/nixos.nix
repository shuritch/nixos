{ config, ... }: {
  users.users.nixos.extraGroups = import ./settings/groups.nix config;
}
