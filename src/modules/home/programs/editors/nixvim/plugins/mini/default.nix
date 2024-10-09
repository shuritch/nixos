{ config, lib, ... }:

# QOL
# https://github.com/echasnovski/mini.nvim/
let cfg = config.programs.nixvim;
in {
  imports = [ ./clue.nix ./diff.nix ./files.nix ./surround.nix ];
  config.programs.nixvim.plugins.mini = lib.mkIf cfg.enable {
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
