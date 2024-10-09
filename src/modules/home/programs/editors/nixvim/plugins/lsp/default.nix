{ config, lib, ... }:

let cfg = config.programs.nixvim.enable;
in {
  imports =
    [ ./conform.nix ./fidget.nix ./hlchunk.nix ./lspsaga.nix ./none-ls.nix ];

  # https://neovim.io/doc/user/lsp.html
  programs.nixvim.plugins = lib.mkIf cfg.enable {
    trouble.enable = true;
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        bashls.enable = true;
        lua-ls.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;
        nushell.enable = true;

        eslint.enable = true;
        html.enable = true;
        cssls.enable = true;
        ts-ls.nable = false;
        svelte.enable = true;
        marksman.enable = true;
        sqls.enable = true;

        dockerls.enable = true;
        docker-compose-language-service.enable = true;

        terraformls.enable = false;
        rust-analyzer.enable = false;
        nginx-language-server.enable = false;
        htmx.enable = false;
        graphql.enable = false;
        denols.enable = false;
        cmake.enable = false;
        clangd.enable = false;
        pyright.enable = false;
        gopl.enable = false;
        zls.enable = false;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };

          gr = {
            action = "references";
            desc = "Goto References";
          };

          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };

          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };

          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };

          K = {
            action = "hover";
            desc = "Hover";
          };

          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };

          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };

        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  programs.nixvim.extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
