{ lib, config, pkgs, ... }:

let cfg = config.plymouth;
in with lib; {
  options.plymouth = {
    enable = mkEnableOption "Whether to enable font profiles";
    customTheme = mkEnableOption "Whether theme is custom";
    themePackages = mkOption {
      type = types.listOf types.anything;
      default = [ ];
    };

    theme = mkOption {
      description = "Enable font profiles";
      type = types.str;
      default = null;
    };
  };

  config = mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      inherit (cfg) theme;
      themePackages = cfg.themePackages ++ (optionals cfg.customTheme
        [ pkgs."plymouth-custom-${cfg.theme}-theme" ]);
    };
  };
}
