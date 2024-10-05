{ config, ... }:

let colors = config.my.home.colorscheme.base16colors;
in {
  imports = [ ./icons.nix ./manager.nix ./rules.nix ./status.nix ];
  programs.yazi.theme = {
    input = {
      border = { fg = colors.base0E; };
      title = { };
      value = { };
      selected = { reversed = true; };
    };

    select = {
      border = { fg = colors.base0E; };
      active = { fg = colors.base09; };
      inactive = { };
    };

    tasks = {
      border = { fg = colors.base0E; };
      hovered = { underline = true; };
      title = { };
    };

    which = {
      mask = { bg = colors.base00; };
      cand = { fg = colors.base0E; };
      rest = { fg = colors.base0E; };
      desc = { fg = colors.base09; };
      separator = "  ";
      separator_style = { fg = colors.base0E; };
    };

    help = {
      on = { fg = colors.base09; };
      exec = { fg = colors.base0E; };
      desc = { fg = colors.base05; };
      hovered = {
        bg = colors.base0E;
        bold = true;
      };
      footer = {
        fg = colors.base00;
        bg = colors.base0E;
      };
    };
  };
}
