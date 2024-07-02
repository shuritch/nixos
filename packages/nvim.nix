{ pkgs, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-24.05";
  });
in
{
  imports = [ nixvim.nixosModules.nixvim ];
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    plugins = {
      lsp-format.enable = true;
      nvim-autopairs.enable = true;

      #? Interface
      lualine = {
        enable = true;
      };

      #? Interface
      which-key = {
        enable = true;
      };

      #? Interface
      nvim-tree = {
        enable = true;
        hijackNetrw = false;
        git = {
          enable = true;
          ignore = false;
        };
      };

      #? Interface
      oil = {
        enable = true;
        settings = {
          view_options.show_hidden = true;
          columns = [
            "icon"
            "permissions"
            "size"
            "mtime"
          ];
        };
      };

      #? File search
      telescope = {
        enable = true;
        extensions = {
          fzf-native = {
            enable = true;
            settings = {
              fuzzy = true;
              overrideFileSorter = true;
              overrideGenericSorter = true;
              caseMode = "smart_case";
            };

          };
        };
      };

      treesitter = {
        enable = true;
        indent = true;
        incrementalSelection.enable = true;
      };

      #? Tab coding
      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };

          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "emoji"; }
            { name = "nerdfont"; }
            { name = "cmp_tabnine"; }
          ];
        };
      };

      #? Code formatter
      conform-nvim = {
        enable = true;
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 500;
        };
        formattersByFt = {
          lua = [ "stylua" ];
          python = [ "isort" "black" ];
          javascript = [ [ "prettierd" "prettier" ] ];
          "*" = [ "codespell" ];
          "_" = [ "trim_whitespace" ];
        };
      };


      #? Code highlighting and validation
      lsp = {
        enable = true;
        servers = {
          svelte.enable = true;
          tsserver.enable = true;
          lua-ls.enable = true;
          nil-ls.enable = true;
          cmake.enable = true;
          gopls.enable = true;
          yamlls.enable = true;
          denols.enable = true;
          jsonls.enable = true;
          html.enable = true;
          cssls.enable = true;
          eslint.enable = true;
        };
      };
    };

    opts = {
      shiftwidth = 2;
      number = true;
      relativenumber = true;
    };
  };
}
