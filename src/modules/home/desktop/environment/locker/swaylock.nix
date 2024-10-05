{ config, pkgs, lib, ... }:

let
  inherit (config.my.home.colorscheme) colors;
  cfg = config.my.home.desktop;
in {
  config.programs.swaylock = lib.mkIf (cfg.enable && cfg.locker == "swaylock") {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      font = config.my.home.desktop.fonts.regular.name;
      font-size = config.my.home.desktop.fonts.regular.size + 3;
      effect-blur = "20x3";
      fade-in = 0.1;

      clock = true;
      line-uses-inside = true;
      disable-caps-lock-text = true;
      show-failed-attempts = true;
      ignore-empty-password = true;
      indicator-caps-lock = true;
      indicator-idle-visible = true;
      indicator-y-position = 1000;
      indicator-thickness = 20;
      indicator-radius = 120;

      ring-color = "${colors.surface_bright}";
      inside-wrong-color = "${colors.on_error}";
      ring-wrong-color = "${colors.error}";
      key-hl-color = "${colors.tertiary}";
      bs-hl-color = "${colors.on_tertiary}";
      ring-ver-color = "${colors.secondary}";
      inside-ver-color = "${colors.on_secondary}";
      inside-color = "${colors.surface}";
      text-color = "${colors.on_surface}";
      text-clear-color = "${colors.on_surface_variant}";
      text-ver-color = "${colors.on_secondary}";
      text-wrong-color = "${colors.on_surface_variant}";
      text-caps-lock-color = "${colors.on_surface_variant}";
      inside-clear-color = "${colors.surface}";
      ring-clear-color = "${colors.primary}";
      inside-caps-lock-color = "${colors.on_tertiary}";
      ring-caps-lock-color = "${colors.surface}";
      separator-color = "${colors.surface}";
    };
  };
}
