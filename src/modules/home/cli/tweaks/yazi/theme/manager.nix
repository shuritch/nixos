{ config, ... }:

let colors = config.my.home.colorscheme.base16colors;
in {
  programs.yazi.theme.manager = {
    cwd = { fg = colors.base09; };

    # Hovered
    hovered = {
      fg = colors.base00;
      bg = colors.base09;
    };

    preview_hovered = {
      fg = colors.base00;
      bg = colors.base09;
    };

    # Find
    find_keyword = {
      fg = colors.base0A;
      italic = true;
    };

    find_position = {
      fg = colors.base09;
      bg = "reset";
      italic = true;
    };

    # Marker
    marker_selected = {
      fg = colors.base0B;
      # bg = colors.base0B;
    };

    marker_copied = {
      fg = colors.base0A;
      # bg = colors.base0A;
    };

    marker_cut = {
      fg = colors.base08;
      # bg = colors.base08;
    };

    # Tab
    tab_active = {
      fg = colors.base00;
      bg = colors.base09;
    };

    tab_inactive = {
      fg = colors.base05;
      bg = colors.base03;
    };

    tab_width = 1;

    # Border;
    border_symbol = "│";
    border_style = { fg = colors.base09; };

    # Offset;
    folder_offset = [ 1 0 1 0 ];
    preview_offset = [ 1 1 1 1 ];

    # Highlighting;
    syntect_theme = "";
  };
}
