{ config, pkgs, ... }:

{   
    imports = [
      /etc/nixos/packages/git.nix
      /etc/nixos/packages/fonts.nix
      /etc/nixos/packages/virtual.nix
      /etc/nixos/packages/terminal.nix
      /etc/nixos/packages/database.nix
    ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    environment.systemPackages = with pkgs; [
      man-pages
      man-pages-posix
      docker-compose
      asciiquarium
      alacritty
      neofetch
      starship
      graphviz
      gnumake
      python3
      gparted
      killall
      ntfs3g
      mkcert
      neovim
      ranger
      unzip
      gnupg
      unrar
      tldr
      bash
      btop  
      wget
      file
      tmux
      gcc  
      bun
      fzf
      bat
      vim
      nil
      act # Github actions
      fd
      jq
  ];
}