{
  # Completion plugin for nvim
  # https://github.com/hrsh7th/nvim-cmp/
  imports = [ ./codecompanion.nix ./lspkind.nix ./schemastore.nix ];
  config.programs.nixvim = {
    plugins = {
      cmp-cmdline.enable = true;

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental.ghost_text = true;
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };

          snippet.expand = "luasnip";
          formatting.fields = [ "kind" "abbr" "menu" ];
          sources = [
            { name = "cmp_tabnine"; }
            { name = "nvim_lua"; }
            { name = "emoji"; }
            { name = "nvim_lsp"; }
            { name = "git"; }
            {
              name = "rg";
              keyword_length = 3;
              option.additional_arguments =
                "--max-depth 6 --one-file-system --ignore-file ${./ignore.rg}";
            }
            { # text within current buffer
              name = "buffer";
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            { # file system paths
              name = "path";
              keywordLength = 3;
            }
            { # snippets
              name = "luasnip";
              keywordLength = 3;
            }
          ];

          window = {
            completion.border = "solid";
            documentation.border = "solid";
          };

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" =
              "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };
    };

    extraConfigLua = ''
      luasnip = require("luasnip")
      kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      local cmp = require'cmp'

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({'/', "?" }, {
        sources = {
          { name = 'buffer' }
        }
      })

      -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
            { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
          }, {
            { name = 'buffer' },
          })
        })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    '';
  };
}
