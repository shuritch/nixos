{
  # Utilities
  # https://github.com/echasnovski/mini.nvim/
  imports = [ ./clue.nix ./diff.nix ./files.nix ./surround.nix ];
  config.programs.nixvim.plugins.mini = {
    mockDevIcons = true;
    enable = true;

    modules = {
      pairs = { }; # { -> }
      icons = { }; # Icon provider
      indentscope = { symbol = ""; }; # Shows indents
      surround = { }; # Surround actions
      bracketed = { }; # Go forward/backward with square brackets
      cursorword = { }; # Highlights similar worlds
      align = { }; # Align text interactively
      ai = { }; # Extend and create a/i textobjects
      # Highlight patterns in text
      hipatterns.highlighters.hex_color.__raw = ''
        require("mini.hipatterns").gen_highlighter.hex_color()
      '';
    };
  };
}
