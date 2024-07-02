{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";

      username = {
        style_user = "bright-white bold";
        style_root = "bright-red bold";
      };

      character = {
        success_symbol = "[#](bold green)";
        error_symbol = "[#](bold red)";
      };
    };
  };

  programs.zsh = {
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enable = true;
    shellInit = "eval \"$(starship init zsh)\"";
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "node" "vscode" "postgres" "docker" "kubectl" ];
      theme = "robbyrussell";
    };
  };
}
