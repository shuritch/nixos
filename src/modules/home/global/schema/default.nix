{ lib, config, pkgs, myLib, ... }:

let
  generate = myLib.generateColorscheme pkgs;
  hexColor = lib.types.strMatching "#([0-9a-fA-F]{3}){1,2}";
  cfg = config.my.home.colorscheme;
in {
  imports = [ ./scripts.nix ];
  options.my.home.colorscheme = {
    source = lib.mkOption {
      type = lib.types.either lib.types.path hexColor;
      default = if config.my.home.desktop.wallpaper != null then
        config.my.home.desktop.wallpaper
      else
        "#2B3975";
    };

    mode = lib.mkOption {
      type = lib.types.enum [ "dark" "light" ];
      default = "dark";
    };

    type = lib.mkOption {
      type = lib.types.enum myLib.colorSchemeTypes;
      default = "fruit-salad";
    };

    generatedDrv = lib.mkOption {
      type = lib.types.package;
      default = generate (cfg.source.name or "default") cfg.source;
    };

    rawColorscheme = lib.mkOption {
      type = lib.types.attrs;
      default = lib.importJSON "${cfg.generatedDrv}/${cfg.type}.json";
    };

    colors = lib.mkOption {
      readOnly = true;
      type = lib.types.attrsOf hexColor;
      default = cfg.rawColorscheme.colors.${cfg.mode};
    };

    base16colors = lib.mkOption {
      readOnly = true;
      type = lib.types.attrsOf hexColor;
      default = with cfg.colors; {
        base00 = surface; # bg
        base01 = surface_variant; # bg alt 1
        base02 = tertiary_container; # bg alt 2
        base03 = primary_container; # bright bg
        base04 = on_surface_variant; # fg alt 1
        base05 = on_surface; # fg
        base06 = on_tertiary_container; # fg alt 2
        base07 = on_primary_container; # bright fg
        base08 = red; # ! red
        base09 = primary; # accent 1
        base0A = yellow; # yellow
        base0B = green; # * green
        base0C = cyan; # ? cyan
        base0D = blue; # ? blue
        base0E = magenta; # magenta
        base0F = error; # accent 2
      };
    };
  };

  config = {
    my.home.colorscheme.mode = lib.mkOverride 1499 "dark";
    home.file.".colorscheme.json".text =
      builtins.toJSON config.my.home.colorscheme;

    specialisation = {
      dark.configuration.my.home.colorscheme.mode = lib.mkOverride 1498 "dark";
      light.configuration.my.home.colorscheme.mode =
        lib.mkOverride 1498 "light";
    };
  };
}
