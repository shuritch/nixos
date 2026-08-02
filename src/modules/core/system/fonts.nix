{ pkgs, config, myLib, lib, ... }:

let cfg = config.my.system.fonts;
in {
  options.my.system.fonts = {
    monospace = myLib.mkFontOption "monospace" {
      name = "FiraMono Nerd Font";
      package = pkgs.nerd-fonts.fira-mono;
    };

    regular = myLib.mkFontOption "regular" {
      name = "Fira Sans";
      package = pkgs.fira;
    };

    extra = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      description = "Extra fonts";
      default = with pkgs; [
        corefonts
        source-sans
        source-serif
        dejavu_fonts
        inter
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

        twemoji-color-font
        noto-fonts-color-emoji
        material-icons
        material-design-icons
        nerd-fonts.jetbrains-mono
        noto-fonts-emoji
        nerd-fonts.symbols-only
      ];
    };
  };

  config.fonts = {
    fontDir.decompressFonts = true;
    fontconfig = {
      enable = true;
      hinting.enable = true;
      antialias = true;
      defaultFonts = {
        monospace = [
          cfg.monospace.name
          # primary latin fallbacks
          "Source Code Pro"
          # unicode coverage
          "Noto Sans Mono"
          "Noto Sans"
          "Noto Serif"
          # CJK coverage
          "Noto Sans CJK JP"
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
          "Noto Sans CJK KR"
          # icon fonts
          "Material Icons"
          "Material Design Icons"
          # final fallback
          "DejaVu Sans Mono"
        ];

        sansSerif = [
          cfg.regular.name
          # primary latin fallbacks
          "Inter"
          "Source Sans 3"
          # unicode coverage
          "Noto Sans"
          # CJK
          "Noto Sans CJK JP"
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
          "Noto Sans CJK KR"
          # icons
          "Material Icons"
          "Material Design Icons"
          # final fallback
          "DejaVu Sans"
        ];

        serif = [
          cfg.regular.name
          # latin serif
          "Source Serif 4"
          # unicode coverage
          "Noto Serif"
          # CJK
          "Noto Serif CJK JP"
          "Noto Serif CJK SC"
          "Noto Serif CJK TC"
          "Noto Serif CJK KR"
          # icons
          "Material Icons"
          "Material Design Icons"
          # final fallback
          "DejaVu Serif"
        ];

        emoji = [ "Twemoji Color Font" "Noto Color Emoji" ];
      };
    };

    packages = [ cfg.fonts.monospace.package cfg.fonts.regular.package ]
      ++ cfg.fonts.extra;
  };
}
