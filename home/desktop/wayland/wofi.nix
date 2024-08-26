{ config, lib, pkgs, ... }:

let rgba = color: alpha: "rgba(${lib.removePrefix "#" color}${alpha})";
in {
  programs.wofi = {
    enable = true;
    package = pkgs.wofi.overrideAttrs (oa: {
      # Fix for https://todo.sr.ht/~scoopta/wofi/174
      patches = (oa.patches or [ ]) ++ [ ./wofi-run-shell.patch ];
    });

    settings = {
      image_size = 48;
      columns = 3;
      allow_images = true;
      insensitive = true;
      run-always_parse_args = true;
      run-cache_file = "/dev/null";
      run-exec_search = true;
      matching = "multi-contains";
    };

    style = ''
      * {
        font-family: "Fira Code", monospace;
      }

      window {
        border-radius: 7px;
        background: ${config.colorscheme.colors.surface};
        border: 1px solid ${rgba config.colorscheme.colors.primary "aa"};
      }
    '';
  };

  home.packages = let inherit (config.programs.password-store) package enable;
  in lib.optional enable (pkgs.pass-wofi.override { pass = package; });
}
