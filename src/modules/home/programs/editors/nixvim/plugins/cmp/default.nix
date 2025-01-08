{
  # Completion plugin for nvim
  # https://github.com/hrsh7th/nvim-cmp/
  imports = [ ./lspkind.nix ./schemastore.nix ];
  config.programs.nixvim.plugins.cmp = {
    enable = true;
    settings = {
      autoEnableSources = true;
      experimental.ghost_text = true;
      formatting.fields = [ "kind" "abbr" "menu" ];
      preselect = "cmp.PreselectMode.None";
      performance = {
        debounce = 60;
        fetchingTimeout = 200;
        maxViewEntries = 30;
      };

      snippet.expand =
        "function(args) require('luasnip').lsp_expand(args.body) end";

      sources = let
        getBuff = ''
          function()
            local buf_size_limit = 1024 * 1024 -- 1MB size limit
            local bufs = vim.api.nvim_list_bufs()
            local valid_bufs = {}
            for _, buf in ipairs(bufs) do
              if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
                table.insert(valid_bufs, buf)
              end
            end
            return valid_bufs
          end
        '';
      in [
        {
          name = "nvim_lsp";
          option.get_bufnrs.__raw = getBuff;
          priority = 1000;
        }
        {
          name = "nvim_lsp_document_symbol";
          option.get_bufnrs.__raw = getBuff;
          priority = 1000;
        }
        {
          name = "treesitter";
          option.get_bufnrs.__raw = getBuff;
          priority = 850;
        }
        {
          name = "luasnip";
          priority = 750;
        }
        {
          name = "buffer";
          option.get_bufnrs.__raw = getBuff;
          priority = 500;
        }
        {
          name = "cmp_tabnine";
          priority = 400;
        }
        {
          name = "rg";
          priority = 300;
          option.additional_arguments =
            "--max-depth 6 --one-file-system --ignore-file ${./ignore.rg}";
        }
        {
          name = "path";
          priority = 300;
        }
        {
          name = "cmdline";
          priority = 300;
        }
        {
          name = "spell";
          priority = 300;
        }
        {
          name = "git";
          priority = 250;
        }
        {
          name = "fish";
          priority = 250;
        }
        {
          name = "calc";
          priority = 150;
        }
        {
          name = "emoji";
          priority = 100;
        }
      ];

      window = {
        completion.__raw = "cmp.config.window.bordered()";
        documentation.__raw = "cmp.config.window.bordered()";
      };

      mapping = {
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<Tab>" =
          "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
        "<S-Tab>" =
          "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
        "<CR>" =
          "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
      };
    };
  };
}
