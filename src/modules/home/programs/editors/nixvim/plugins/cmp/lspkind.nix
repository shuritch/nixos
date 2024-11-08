{
  # vscode-like pictograms for neovim lsp completion items
  # https://github.com/onsails/lspkind.nvim
  programs.nixvim.plugins.lspkind = {
    enable = true;
    symbolMap = {
      Copilot = "";
      TabNine = "";
    };

    cmp = {
      enable = true;
      menu = {
        buffer = "";
        calc = "";
        cmdline = "";
        codeium = "󱜙";
        emoji = "󰞅";
        git = "";
        luasnip = "󰩫";
        neorg = "";
        nvim_lsp = "";
        nvim_lua = "";
        path = "";
        spell = "";
        treesitter = "󰔱";
      };
    };

    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
