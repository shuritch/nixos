{
  # QOL
  # https://github.com/echasnovski/mini.nvim/
  imports = [ ./clue.nix ./diff.nix ./files.nix ./surround.nix ];
  config.programs.nixvim.plugins.mini = {
    mockDevIcons = true;
    enable = true;

    # Disabling
    modules = {
      icons = { };
      hipatterns = { };
      indentscope = { symbol = ""; };
      surround = { };
      bracketed = { };
      notify = { };
      align = { };
      ai = { };
    };
  };
}
