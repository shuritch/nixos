{ config, ... }:

let colors = config.my.home.colorscheme.base16colors;
in {
  imports = [ ./icons.nix ./manager.nix ./rules.nix ./status.nix ];
  programs.yazi.theme = {
    input = {
      border = { fg = colors.base09; };
      title = { };
      value = { };
      selected = { reversed = true; };
    };

    select = {
      border = { fg = colors.base09; };
      active = { fg = colors.base0F; };
      inactive = { };
    };

    tasks = {
      border = { fg = colors.base09; };
      hovered = { underline = true; };
      title = { };
    };

    which = {
      mask = { bg = colors.base00; };
      cand = { fg = colors.base09; };
      rest = { fg = colors.base09; };
      desc = { fg = colors.base0F; };
      separator = "  ";
      separator_style = { fg = colors.base09; };
    };

    help = {
      on = { fg = colors.base0F; };
      exec = { fg = colors.base09; };
      desc = { fg = colors.base05; };
      hovered = {
        bg = colors.base09;
        bold = true;
      };
      footer = {
        fg = colors.base00;
        bg = colors.base09;
      };
    };
  };
}
