{ pkgs, ... }: {
  imports = [ ./treesitter-textobjects.nix ];
  plugins.treesitter-context.enable = true;
  filetype.extension.liq = "liquidsoap";
  plugins.treesitter = {
    enable = true;
    folding = true;
    languageRegister.liq = "liquidsoap";
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
  };

  extraConfigLua = ''
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.liquidsoap = {
      filetype = "liquidsoap",
    }
  '';
}
