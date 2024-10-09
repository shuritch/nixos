{ config, lib, pkgs, ... }:

# https://github.com/L3MON4D3/LuaSnip
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.luasnip = lib.mkIf cfg.enable {
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
