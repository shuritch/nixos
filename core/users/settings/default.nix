{ pkgs, config, ... }: {
  users = {
    mutableUsers = false;
    defaultUserShell = if config.programs.fish.enable then
      pkgs.fish
    else if config.programs.zsh.enable then
      pkgs.zsh
    else
      pkgs.bash;
  };
}
