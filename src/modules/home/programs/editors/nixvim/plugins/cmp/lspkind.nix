{
  # vscode-like pictograms for neovim lsp completion items
  # https://github.com/onsails/lspkind.nvim
  programs.nixvim.plugins.lspkind = {
    enable = true;
    symbolMap = {
      Copilot = "";
      TabNine = "";
    };

    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
