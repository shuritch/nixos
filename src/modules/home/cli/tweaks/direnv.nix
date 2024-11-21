{ config, lib, pkgs, ... }:

let cfg = config.my.home.cli;
in {
  config.programs.direnv = lib.mkIf cfg.enableTweaks {
    enable = true;
    silent = true;
    nix-direnv.enable = true;

    # store direnv in cache and not per project
    stdlib = ''
      : ''${XDG_CACHE_HOME:=$HOME/.cache}
      declare -A direnv_layout_dirs

      direnv_layout_dir() {
        echo "''${direnv_layout_dirs[$PWD]:=$(
          echo -n "$XDG_CACHE_HOME"/direnv/layouts/
          echo -n "$PWD" | ${pkgs.perl}/bin/shasum | cut -d ' ' -f 1
        )}"
      }
    '';
  };
}
