{
  # https://neovim.io/doc/user/lsp.html
  programs.nixvim.plugins = {
    trouble.enable = true; # https://github.com/folke/trouble.nvim
    lsp-format.enable = true; # https://github.com/lukas-reineke/lsp-format.nvim
    lsp-lines.enable = true; # https://git.sr.ht/~whynothugo/lsp_lines.nvim
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd.enable = true;
        bashls.enable = true;
        lua_ls.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;
        # nushell.enable = true;

        eslint.enable = true;
        html.enable = true;
        cssls.enable = true;
        ts_ls.enable = false;
        svelte.enable = true;
        markdown_oxide.enable = true;
        terraformls.enable = true;
        sqls.enable = true;
        dockerls.enable = true;
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

          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
      };
    };
  };
}
