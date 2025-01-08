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
          primary = with config.my.home.colorscheme.colors; {
            background = surface;
            foreground = on_surface;
          };

          normal = with config.my.home.colorscheme.colors; {
            black = surface_bright;
            white = on_surface;
            red = red;
            green = green;
            yellow = yellow;
            blue = blue;
            magenta = magenta;
            cyan = cyan;
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
