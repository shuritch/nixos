{ lib, config, ... }:
let
  cfg = config.fontProfiles;
  mkFontOption = kind: {
    name = lib.mkOption {
      type = lib.types.str;
      default = null;
      description = "Family name for ${kind} font profile";
      example = "Fira Code";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = null;
      description = "Package for ${kind} font profile";
      example = "pkgs.fira-code";
    };
    size = lib.mkOption {
      type = lib.types.int;
      default = 12;
      description = "Size in pixels for ${kind} font profile";
      example = "14";
    };
  };
in {
  options.fontProfiles = {
    enable = lib.mkEnableOption "Whether to enable font profiles";
    monospace = mkFontOption "monospace";
    regular = mkFontOption "regular";
    extra = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      description = "Extra fonts";
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = [ cfg.monospace.package cfg.regular.package ] ++ cfg.extra;
  };
}
