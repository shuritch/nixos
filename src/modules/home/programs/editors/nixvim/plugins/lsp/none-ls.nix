{ config, lib, pkgs, ... }:

# https://github.com/nvimtools/none-ls.nvim/
let cfg = config.programs.nixvim;
in {
  programs.nixvim.plugins.none-ls = lib.mkIf cfg.enable {
    enable = true;
    enableLspFormat = true;
    settings.updateInInsert = false;
    sources = {
      code_actions = {
        # gitsigns.enable = true;
        statix.enable = true;
      };

      diagnostics = {
        statix.enable = true;
        yamllint.enable = true;
        codespell.enable = true;
        deadnix.enable = true;
        markdownlint.enable = true;
      };

      formatting = {
        shfmt.enable = true;
        sql_formatter.enable = true;
        codespell.enable = true;
        stylua.enable = true;
        yamlfmt.enable = true;
        hclfmt.enable = true;

        nixfmt = {
          enable = true;
          package = pkgs.nixfmt-classic;
        };

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
              extra_args = {
                "--no-semi",
                "--single-quote"
              },
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
