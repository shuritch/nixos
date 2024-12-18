{ pkgs, config, myLib, lib, ... }:

let cfg = config.my.home.desktop;
in {
  options.my.home.desktop.fonts = {
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
      default = with pkgs; [ nerd-fonts.jetbrains-mono noto-fonts-emoji ];
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = [ cfg.fonts.monospace.package cfg.fonts.regular.package ]
      ++ cfg.fonts.extra;
  };
}
