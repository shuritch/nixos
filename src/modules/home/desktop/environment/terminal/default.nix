{ lib, config, ... }:

let cfg = config.my.home.desktop;
in {
  imports = [ ./kitty.nix ./alacritty.nix ];
  options.my.home.desktop.terminal = lib.mkOption {
    description = "Choose preferred terminal application.";
    type = lib.types.nullOr (lib.types.enum [ "alacritty" "kitty" ]);
    default = null;
  };

  config = lib.mkIf (cfg.enable && cfg.terminal != null) {
    home.sessionVariables.TERMINAL = cfg.terminal;
    xdg.mimeApps = lib.optionalAttrs (cfg.terminal != null) {
      associations.added."x-scheme-handler/terminal" =
        "${cfg.terminal}.desktop";
      defaultApplications."x-scheme-handler/terminal" =
        "${cfg.terminal}.desktop";
    };
  };
}
