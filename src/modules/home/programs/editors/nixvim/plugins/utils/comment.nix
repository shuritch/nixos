{ config, lib, ... }:

# https://github.com/numtostr/comment.nvim/
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.comment =
    lib.mkIf cfg.enable { enable = true; };
}
