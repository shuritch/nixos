{ lib, config, pkgs, ... }:

let cfg = config.my.home.cli;
in {
  imports = [
    ./bat
    ./btop
    ./yazi
    ./direnv.nix
    ./editorconfig.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./ripgrep.nix
    ./tealdeer.nix
    ./thefuck.nix
    ./zoxide.nix
  ];

  options.my.home.cli.enableTweaks = lib.mkEnableOption "Enable cli tweaks.";
  config.home.packages = (lib.optionals cfg.enableTweaks [
    pkgs.vhs # Shell GIFS
    pkgs.wget2 # Better wget
    pkgs.jq # JSON parser
    pkgs.yq # YAML parser
    pkgs.bottom # System viewer
    pkgs.diffsitter # Better diff
    pkgs.httpie # Better curl
    pkgs.ncdu # TUI disk usage
    pkgs.curlHTTP3 # With quic support
  ]);
}
