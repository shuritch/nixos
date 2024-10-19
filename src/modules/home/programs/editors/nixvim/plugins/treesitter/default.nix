{ pkgs, ... }: {
  imports = [ ./textobjects.nix ];
  # https://github.com/nvim-treesitter/nvim-treesitter/
  config.programs.nixvim.plugins.treesitter = {
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    nixvimInjections = true;
    folding = true;
    enable = true;
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
  };
}
