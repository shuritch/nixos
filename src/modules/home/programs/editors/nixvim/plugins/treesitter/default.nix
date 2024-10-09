{ config, lib, pkgs, ... }:

# https://github.com/nvim-treesitter/nvim-treesitter/
let cfg = config.programs.nivim;
in {
  config.programs.nixvim = lib.mkIf cfg.enable {
    filetype.extension.liq = "liquidsoap";
    plugins.treesitter = {
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      languageRegister.liq = "liquidsoap";
      nixvimInjections = true;
      folding = true;
      enable = true;
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
  };
}
