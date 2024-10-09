{ lib, config, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.terminal == "alacritty") {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 0.9;
          padding = {
            x = 24;
            y = 26;
          };
        };

        colors = rec {
          bright = normal;
          primary = {
            background = config.my.home.colorscheme.colors.surface;
            foreground = config.my.home.colorscheme.colors.on_surface;
          };

          normal = {
            black = config.my.home.colorscheme.colors.surface_bright;
            white = config.my.home.colorscheme.colors.on_surface;
            red = config.my.home.colorscheme.harmonized.red;
            green = config.my.home.colorscheme.harmonized.green;
            yellow = config.my.home.colorscheme.harmonized.yellow;
            blue = config.my.home.colorscheme.harmonized.blue;
            magenta = config.my.home.colorscheme.harmonized.magenta;
            cyan = config.my.home.colorscheme.harmonized.cyan;
          };
        };

        cursor.style = {
          shape = "Beam";
          blinking = "Off";
        };

        font = let font = cfg.fonts.monospace;
        in {
          size = font.size;
          normal = {
            inherit (font) name;
            style = "Regular";
          };

          bold = {
            inherit (font) name;
            style = "Bold";
          };

          italic = {
            inherit (font) name;
            style = "Regular";
          };

          bold_italic = {
            inherit (font) name;
            style = "Regular Bold";
          };
        };
      };
    };

    xdg.mimeApps.associations.added = {
      "x-scheme-handler/terminal" = "Alacritty.desktop";
    };
  };
}
