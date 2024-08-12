{ pkgs, ... }: {
  imports = [
    ./nixvim
    ./fish.nix
    ./git.nix
    ./kitty.nix
    ./nix-index.nix
    ./shellcolor.nix
    ./starship.nix
  ];

  programs.bash.enable = true;
  programs.ssh.enable = true;
  programs.bat = {
    enable = true;
    config.theme = "base16";
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [ "--color 16" ];
  };

  programs.gh = {
    enable = true;
    extensions = with pkgs; [ gh-markdown-preview ];
    settings = {
      version = "1";
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables.PF_INFO =
    "ascii title os kernel uptime shell de palette";

  home.packages = with pkgs; [
    fastfetch
    pfetch-rs
    comma # Install and run programs by sticking a , before them
    distrobox # Nice escape hatch, integrates docker images with my environment
    brightnessctl # Brightness mananger

    nmap
    bc # Calculator
    bottom # System viewer
    ncdu # TUI disk usage
    eza # Better ls
    ripgrep # Better grep
    fd # Better find
    httpie # Better curl
    diffsitter # Better diff
    jq # JSON pretty printer and manipulator
    timer # To help with my ADHD paralysis
    bar # Better cat
    file # File type
    tree # console.dir
    wget
    tldr
    # rar
    unrar
    zip
    unzip
    htop
    man-pages-posix
    killall
    openssl
    ntfs3g
    ranger
    btop
    tmux
    lazygit
    mkcert
    mediainfo
    gnupg
    stable.nixfmt-classic
    # nil # Nix Language server
    nixd # Nix Language server
    # alejandra # Nix formatter
    # nixfmt-classic # Nix formatter
    #nixpkgs-fmt #  Nix formatter
    #nixfmt-rfc-style  # Nix formatter
    nvd # Differ
    nix-diff # Differ, more detailed
    nix-output-monitor
    nh # Nice wrapper for NixOS and HM
    ltex-ls # Spell checking LSP
  ];
}
