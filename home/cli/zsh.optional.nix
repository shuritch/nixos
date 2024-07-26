{ config, ... }:

let flake-location = config.flakeLocation;
in {
  programs.zsh = {
    enable = true;
    history.size = 10000;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.path = "${config.xdg.dataHome}/zsh/history";
    initExtra = ''eval "$(starship init zsh)"'';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "node" "vscode" "postgres" "docker" "kubectl" ];
      theme = "robbyrussell"; # agnoster / blinks / robbyrussell
    };

    shellAliases = {
      rb = "sudo nixos-rebuild switch --flake ${flake-location}";
      upd = "nix flake update ${flake-location}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flake-location}";

      hms = "home-manager switch --flake ${flake-location}";

      conf = "nvim ${flake-location}/nixos/configuration.nix";
      pkgs = "nvim ${flake-location}/nixos/packages.nix";

      ll = "ls -l";
      v = "nvim";
      se = "sudoedit";
      ff = "fastfetch";
    };
  };
}
