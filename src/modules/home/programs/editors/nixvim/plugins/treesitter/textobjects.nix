{ config, lib, ... }:

# https://github.com/nvim-treesitter/nvim-treesitter-textobjects
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.treesitter-textobjects =
    lib.mkIf (cfg.enable && cfg.treesitter.enable) {
      enable = true;

      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ii" = "@conditional.inner";
          "ai" = "@conditional.outer";
          "il" = "@loop.inner";
          "al" = "@loop.outer";
          "at" = "@comment.outer";
        };
      };

      move = {
        enable = true;
        gotoNextStart = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };

      swap = {
        enable = true;
        swapNext."<leader>a" = "@parameters.inner";
        swapPrevious."<leader>A" = "@parameter.outer";
      };
    };
}
