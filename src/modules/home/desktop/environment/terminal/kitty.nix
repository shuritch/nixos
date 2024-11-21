{ config, pkgs, lib, ... }:

let
  inherit (config.my.home.colorscheme) colors harmonized;
  cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.terminal == "kitty") {
    programs.kitty = {
      enable = true;
      font = { inherit (config.my.home.desktop.fonts.monospace) name size; };
      keybindings = { };
      settings = {
        editor = config.home.sessionVariables.EDITOR;
        shell_integration = "no-rc";
        scrollback_lines = 4000;
        scrollback_pager_history_size = 100000;
        window_padding_width = 15;
        foreground = "${colors.on_surface}";
        background = "${colors.surface}";
        selection_background = "${colors.on_surface}";
        selection_foreground = "${colors.surface}";
        url_color = "${colors.on_surface_variant}";
        cursor = "${colors.on_surface}";
        active_border_color = "${colors.outline}";
        inactive_border_color = "${colors.surface_bright}";
        active_tab_background = "${colors.surface}";
        active_tab_foreground = "${colors.on_surface}";
        inactive_tab_background = "${colors.surface_bright}";
        inactive_tab_foreground = "${colors.on_surface_variant}";
        tab_bar_background = "${colors.surface_bright}";
        color0 = "${colors.surface}";
        color1 = "${harmonized.red}";
        color2 = "${harmonized.green}";
        color3 = "${harmonized.yellow}";
        color4 = "${harmonized.blue}";
        color5 = "${harmonized.magenta}";
        color6 = "${harmonized.cyan}";
        color7 = "${colors.on_surface}";
        color8 = "${colors.outline}";
        color9 = "${harmonized.red}";
        color10 = "${harmonized.green}";
        color11 = "${harmonized.yellow}";
        color12 = "${harmonized.blue}";
        color13 = "${harmonized.magenta}";
        color14 = "${harmonized.cyan}";
        color15 = "${colors.surface_dim}";
        color16 = "${harmonized.orange}";
        color17 = "${colors.error}";
        color18 = "${colors.surface_bright}";
        color19 = "${colors.surface_container}";
        color20 = "${colors.on_surface_variant}";
        color21 = "${colors.inverse_surface}";
      };
    };

    home = {
      sessionVariables.NIX_INSPECT_EXCLUDE = "kitty ncurses imagemagick";
      packages = [
        (pkgs.writeShellScriptBin "xterm" ''
          ${lib.getExe config.programs.kitty.package} "$@"
        '')
      ];
    };

    xdg.configFile."kitty/ssh.conf".text = ''
      share_connections no
    '';
  };
}
