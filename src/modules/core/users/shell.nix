{ config, pkgs, ... }:

let
  shell = if config.programs.fish.enable then
    pkgs.fish
  else if config.programs.nushell.enable then
    pkgs.nushell
  else if config.programs.zsh.enable then
    pkgs.zsh
  else
    pkgs.bash;
in {
  users.defaultUserShell = shell;
  environment.shells = [ shell ];
}
