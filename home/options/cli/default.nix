{ pkgs, ... }: {
  imports =
    [ ./nixdb.nix ./git.nix ./bat.nix ./fzf.nix ./gh.nix ./shell ./nvim ];

  programs.ssh.enable = true;
  programs.zoxide.enable = true; # Better cd
  home.packages = with pkgs; [
    stable.nixfmt-classic # Nix formatter
    nixd # Nix Language server
    nvd # Differ
    nix-diff # Differ, more detailed
    nix-output-monitor
    nh # Nice wrapper for NixOS and HM
    ltex-ls # Spell checking LSP
    comma # Install and run programs by sticking a , before them
    distrobox # Nice escape hatch, integrates docker images with my environment
    brightnessctl # Brightness mananger

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
    btop # Better htop
    tldr # Man pages examples
    ntfs3g # Windows subsystem
    man-pages-posix
    wget
    unrar
    zip
    unzip
    killall
    openssl
    ranger
    mediainfo
    gnupg
  ];
}
