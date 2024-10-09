{ config, lib, ... }:

# Beutiful boxes inside comments
# https://github.com/LudoPinelli/comment-box.nvim/
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.comment-box =
    lib.mkIf cfg.enable { enable = true; };
}
