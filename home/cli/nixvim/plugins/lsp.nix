{
  programs.nixvim.plugins = {
    lsp-format.enable = true; # ?
    hmts.enable = true;

    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        formattersByFt = {
          lua = [ "stylua" ];
          python = [ "isort" "black" ];
          javascript = [[ "prettierd" "prettier" ]];
          "*" = [ "codespell" ];
          "_" = [ "trim_whitespace" ];
        };
      };
    };

    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings.indent.enable = true;
      folding = true;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

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
}
