{ config, pkgs, ... }: {
  users.defaultUserShell = if config.programs.fish.enable then
    pkgs.fish
  else if config.programs.nushell.enable then
    pkgs.nushell
  else if config.programs.zsh.enable then
    pkgs.zsh
  else
    pkgs.bash;
}
