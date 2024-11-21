{ config, ... }:

let colors = config.my.home.colorscheme.base16colors;
in {
  programs.yazi.theme.status = {
    separator_open = "█";
    separator_close = "█";
    separator_style = {
      fg = colors.base03;
      bg = colors.base03;
    };

    # Mode;
    mode_normal = {
      fg = colors.base00;
      bg = colors.base09;
      bold = true;
    };

    mode_select = {
      fg = colors.base00;
      bg = colors.base0B;
      bold = true;
    };

    mode_unset = {
      fg = colors.base00;
      bg = colors.base09;
      bold = true;
    };

    # Progress;
    progress_label = { bold = true; };
    progress_normal = {
      fg = colors.base09;
      bg = colors.base00;
    };

    progress_error = {
      fg = "red";
      bg = colors.base00;
    };

    # Permissions;
    permissions_t = { fg = colors.base09; };
    permissions_r = { fg = colors.base0A; };
    permissions_w = { fg = colors.base08; };
    permissions_x = { fg = colors.base0B; };
    permissions_s = { fg = colors.base03; };
  };
}
