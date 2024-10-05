{ lib, config, pkgs, myLib, ... }:

let
  generate = myLib.generateColorscheme pkgs;
  cfg = config.my.home.colorscheme;
  hexColor = lib.types.strMatching "#([0-9a-fA-F]{3}){1,2}";
  removeFilterPrefixAttrs = prefix: attrs:
    lib.mapAttrs' (n: v: {
      name = lib.removePrefix prefix n;
      value = v;
    }) (lib.filterAttrs (n: _: lib.hasPrefix prefix n) attrs);
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
      default = {
        base00 = cfg.colors.surface; # bg
        base01 = cfg.colors.surface_variant; # bg alt 1
        base02 = cfg.colors.tertiary_container; # bg alt 2
        base03 = cfg.colors.primary_container; # bright bg
        base04 = cfg.colors.on_surface_variant; # fg alt 1
        base05 = cfg.colors.on_surface; # fg
        base06 = cfg.colors.on_tertiary_container; # fg alt 2
        base07 = cfg.colors.on_primary_container; # bright fg
        base08 = cfg.harmonized.red; # ! red
        base09 = cfg.colors.primary; # accent 1
        base0A = cfg.harmonized.yellow; # yellow
        base0B = cfg.harmonized.green; # * green
        base0C = cfg.harmonized.cyan; # ? cyan
        base0D = cfg.harmonized.blue; # ? blue
        base0E = cfg.harmonized.magenta; # magenta
        base0F = cfg.colors.error; # accent 2
      };
    };

    harmonized = lib.mkOption {
      readOnly = true;
      type = lib.types.attrsOf hexColor;
      default = removeFilterPrefixAttrs "${cfg.mode}-"
        cfg.rawColorscheme.harmonized_colors;
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
