{ pkgs, env-config, outputs, ... }: {
  nixpkgs = {
    hostPlatform.system = env-config.platform;
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "python-2.7.18.8" "electron-25.9.0" ];
    };
  };

  environment.systemPackages = with pkgs; [
    #? CLI
    ntfs3g # Windows partitions
    fastfetch # About C
    file # File type
    tree # console.dir
    ranger # File explorer
    fd # Better find
    fzf # Fuzzy finder
    bar # Better cat
    tldr # Short man
    bluez-tools
    ripgrep # Better grep
    bluez
    lazygit
    git
    wget
    bash
    git
    htop
    btop
    bottom # Taks manager
    tmux # Terminal manipulation
    unzip
    zip
    unrar
    eza # Better ls
    rar
    gnupg
    openssl
    mediainfo
    killall
    mkcert
    httpie # Better curl
    ncdu # TUI disk usage
    diffsitter # Better diff
    jq # JSON pretty printer and manipulator
    nh # Nice wrapper for NixOS and HM
    nix-output-monitor
    man-pages-posix

    # Other
    nixd # Nix LSP
    nix-index # Nix database neofetch # About
    nil # Nix language server
    nixfmt-classic # Nix formatter
    nixfmt-rfc-style
    nixpkgs-fmt
    ltex-ls # Spell checking LSP
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    home-manager
    chromium

    # Wayland
    #dmenu
    #light
    #swww
    #makorofi
    #wofi
    #xwayland
    #wl-clipboard
    #cliphist
    #herbstluftwm
    #hyprland
    #seatd
    #xdg-desktop-portal-hyprland
    #polybar
    #waybar

    # Sound
    pipewire
    pulseaudio
    pamixer

    # Coding stuff
    nodejs_latest
    nodejs_latest.pkgs.dockerfile-language-server-nodejs
    nodejs_latest.pkgs.pnpm
    nodejs_latest.pkgs.yarn
    nodejs_latest.pkgs.prettier
    nodejs_latest.pkgs."@prisma/language-server"
    nodejs_latest.pkgs.typescript-language-server
    nodejs_latest.pkgs.vscode-langservers-extracted
    pkgs.nodePackages.npm-check-updates
    docker-compose
    gnumake
    python
    gcc
    act
  ];
}
