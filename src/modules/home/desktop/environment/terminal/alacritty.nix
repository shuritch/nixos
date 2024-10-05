{ lib, config, ... }:

let cfg = config.my.home.desktop;
in {
  config.programs.alacritty =
    lib.mkIf (cfg.enable && cfg.terminal == "alacritty") {
      enable = true;
      settings = {
        window.opacity = 0.9;
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
}
