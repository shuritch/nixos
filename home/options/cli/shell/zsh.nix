{
  imports = [ ./settings/starship.nix ];
  programs.zsh = {
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "node" "vscode" "postgres" "docker" "kubectl" ];
      theme = "robbyrussell";
    };
  };
}
