{ config, lib, ... }:

# Context of the function (as first line)
# https://github.com/nvim-treesitter/nvim-treesitter-context/
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.treesitter-context =
    lib.mkIf (cfg.enable && cfg.treesitter.enable) { enable = true; };
}
