{ config, lib, pkgs, ... }:

let
  cfg = config.my.home.cli;
  colors = config.my.home.colorscheme.base16colors;
in {
  config.programs.fzf = lib.mkIf cfg.enableTweaks {
    enable = true;
    defaultCommand = "${lib.getExe pkgs.fd} --type=f --hidden --exclude=.git";
    fileWidgetCommand =
      "${lib.getExe pkgs.fd} --type=f --hidden --exclude=.git";

    defaultOptions = [
      "--color=16"
      "--height=30%"
      "--layout=reverse"
      "--info=inline"

      "--ansi"
      "--with-nth=1.."
      "--pointer=' '"
      "--pointer=' '"
      "--header-first"
      "--border=rounded"
    ];

    colors = {
      "preview-bg" = "-1";
      "gutter" = "-1";
      "bg" = "-1";
      "bg+" = "-1";
      "fg" = colors.base04;
      "fg+" = colors.base0E;
      "hl" = colors.base0A;
      "hl+" = colors.base0A;
      "header" = colors.base0E;
      "info" = colors.base0E;
      "pointer" = colors.base0C;
      "marker" = colors.base0C;
      "prompt" = colors.base0E;
      "spinner" = colors.base0C;
      "preview-fg" = colors.base0E;
    };
  };
}
