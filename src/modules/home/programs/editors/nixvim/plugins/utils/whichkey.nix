{ config, lib, ... }:

# Keybinds helper
# https://github.com/folke/which-key.nvim/
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.which-key =
    lib.mkIf cfg.enable { enable = true; };
}
