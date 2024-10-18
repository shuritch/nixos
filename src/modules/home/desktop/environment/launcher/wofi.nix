{ config, pkgs, lib, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.launcher == "wofi") {
    home.packages = [ pkgs.wofi-emoji ];
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
          font-family: ${config.my.home.desktop.fonts.regular.name}, ${config.my.home.desktop.fonts.monospace.name};
        }

        window {
          border-radius: 7px;
          border: 1px solid ${config.my.home.colorscheme.colors.primary};
        }
      '';
    };
  };
}
