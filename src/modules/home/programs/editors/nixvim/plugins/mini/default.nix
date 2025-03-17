{
  # Utilities
  # https://github.com/echasnovski/mini.nvim/
  imports = [ ./clue.nix ./diff.nix ./files.nix ];
  config.programs.nixvim.plugins.mini = {
    mockDevIcons = true;
    enable = true;

    modules = {
      ai = { }; # Extend and create a/i textobjects
      icons = { }; # Icon provider
      # pairs = { }; # { -> }
      # indentscope = { symbol = ""; }; # Shows indents
      # surround = { }; # Surround actions
      # bracketed = { }; # Go forward/backward with square brackets
      # cursorword = { }; # Highlights similar worlds
      # align = { }; # Align text interactively
      # # Highlight patterns in text
      # hipatterns.highlighters.hex_color.__raw = ''
      #   require("mini.hipatterns").gen_highlighter.hex_color()
      # '';
    };
  };
}
