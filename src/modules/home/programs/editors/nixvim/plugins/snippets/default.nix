{ pkgs, ... }: {
  # https://github.com/L3MON4D3/LuaSnip
  config.programs.nixvim.plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };

    fromVscode = [{
      lazyLoad = true;
      paths = "${pkgs.vimPlugins.friendly-snippets}";
    }];
  };
}
