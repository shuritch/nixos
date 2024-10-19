{
  # null-ls replacement
  # https://github.com/nvimtools/none-ls.nvim/
  config.programs.nixvim = {
    plugins.none-ls = {
      enable = true;
      enableLspFormat = true;
      settings.updateInInsert = false;
      sources = {
        formatting = { };
        code_actions.statix.enable = true;
        diagnostics = {
          actionlint.enable = true;
          # markdownlint.enable = true;
          # stylelint.enable = true;
          codespell.enable = true;
          yamllint.enable = true;
          deadnix.enable = true;
          statix.enable = true;
        };
      };
    };

    keymaps = [{
      mode = [ "n" "v" ];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }];
  };
}
