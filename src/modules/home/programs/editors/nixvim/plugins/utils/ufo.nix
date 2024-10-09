{ config, lib, ... }:

# Better folding
# https://github.com/kevinhwang91/nvim-ufo
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.nvim-ufo =
    lib.mkIf cfg.enable { enable = true; };
}
