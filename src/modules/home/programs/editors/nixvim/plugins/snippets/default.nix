{ pkgs, ... }: {
  # Snippet engine
  # https://github.com/L3MON4D3/LuaSnip
  config.programs.nixvim.plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };

    fromVscode = [{
      lazyLoad = true; # https://github.com/rafamadriz/friendly-snippets
      paths = "${pkgs.vimPlugins.friendly-snippets}";
    }];
  };
}
