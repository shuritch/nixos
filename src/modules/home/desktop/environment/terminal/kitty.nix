{ config, pkgs, lib, ... }:

let
  inherit (config.my.home.colorscheme) colors;
  cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.terminal == "kitty") {
    programs.kitty = {
      enable = true;
      font = { inherit (config.my.home.desktop.fonts.monospace) name size; };
      keybindings = { };
      settings = with colors; {
        editor = config.home.sessionVariables.EDITOR;
        shell_integration = "no-rc";
        scrollback_lines = 4000;
        scrollback_pager_history_size = 100000;
        window_padding_width = 15;
        foreground = "${on_surface}";
        background = "${surface}";
        selection_background = "${on_surface}";
        selection_foreground = "${surface}";
        url_color = "${on_surface_variant}";
        cursor = "${on_surface}";
        active_border_color = "${outline}";
        inactive_border_color = "${surface_bright}";
        active_tab_background = "${surface}";
        active_tab_foreground = "${on_surface}";
        inactive_tab_background = "${surface_bright}";
        inactive_tab_foreground = "${on_surface_variant}";
        tab_bar_background = "${surface_bright}";
        color0 = "${surface}";
        color1 = "${red}";
        color2 = "${green}";
        color3 = "${yellow}";
        color4 = "${blue}";
        color5 = "${magenta}";
        color6 = "${cyan}";
        color7 = "${on_surface}";
        color8 = "${outline}";
        color9 = "${red}";
        color10 = "${green}";
        color11 = "${yellow}";
        color12 = "${blue}";
        color13 = "${magenta}";
        color14 = "${cyan}";
        color15 = "${surface_dim}";
        color16 = "${orange}";
        color17 = "${error}";
        color18 = "${surface_bright}";
        color19 = "${surface_container}";
        color20 = "${on_surface_variant}";
        color21 = "${inverse_surface}";
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
