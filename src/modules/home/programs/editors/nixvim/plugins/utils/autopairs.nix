{ config, lib, ... }:

# https://github.com/windwp/nvim-autopairs/
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.nvim-autopairs =
    lib.mkIf cfg.enable { enable = true; };
}
