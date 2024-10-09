{ config, lib, ... }:

# Background for colors (hex, rgb, etc)
# https://github.com/norcalli/nvim-colorizer.lua
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.nvim-colorizer =
    lib.mkIf cfg.enable { enable = true; };
}
