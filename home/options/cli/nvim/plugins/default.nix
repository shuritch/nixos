{
  imports = [ ./lualine.nix ./luasnip.nix ./completion ./treesitter ./ui ];

  plugins.which-key.enable = true;
  plugins.nvim-ufo.enable = true;
}
