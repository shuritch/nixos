{ config, lib, ... }:

# Markdown preview
# https://github.com/OXY2DEV/markview.nvim/
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.markview =
    lib.mkIf cfg.enable { enable = true; };
}
