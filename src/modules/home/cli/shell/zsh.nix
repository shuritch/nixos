{ lib, config, ... }:

let cfg = config.my.home.cli.shell;
in {
  config.programs.zsh = lib.mkIf (cfg.type == "zsh") {
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = cfg.aliases;
    enable = true;

    zsh-abbr = {
      enable = true;
      abbreviations = cfg.abbrs;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "node" "vscode" "postgres" "docker" "kubectl" ];
      theme = "robbyrussell";
    };
  };
}
