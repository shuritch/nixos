{ config, lib, ... }:

# https://github.com/ThePrimeagen/git-worktree.nvim
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.git-worktree = lib.mkIf cfg.enable {
    enableTelescope = true;
    enable = true;
  };
}
