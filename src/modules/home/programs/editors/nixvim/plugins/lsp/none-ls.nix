{
  # Auto code actions (formatter)
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings.updateInInsert = false;
    sources = {
      code_actions.statix.enable = true;
      diagnostics = {
        statix.enable = true;
        yamllint.enable = true;
      };

      formatting = {
        nixpkgs_fmt.enable = true;
        stylua.enable = true;
        yamlfmt.enable = true;
        hclfmt.enable = true;
        black = {
          enable = true;
          settings = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
          settings = ''
            {
              extra_args = { "--no-semi", "--single-quote" },
            }
          '';
        };
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
}
