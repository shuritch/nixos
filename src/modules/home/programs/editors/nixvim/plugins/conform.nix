{
  # Formatter plugin
  # https://github.com/stevearc/conform.nvim/
  config.programs.nixvim.plugins.conform-nvim = {
    enable = true;

    lazyLoad.settings = {
      cmd = [ "ConformInfo" ];
      event = [ "BufWrite" ];
    };

    settings = {
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };

      notifyOnError = true;
      formatters_by_ft = {
        python = [ "black" ];
        html = [ "prettier" ];
        css = [ "prettier" ];
        javascript = [ "prettier" ];
        javascriptreact = [ "prettier" ];
        typescript = [ "prettier" ];
        typescriptreact = [ "prettier" ];
        svelte = [ "prettier" ];
        toml = [ "taplo" ];
        bash = [ "shfmt" ];
        lua = [ "stylua" ];
        sh = [ "shfmt" ];
        nix = [ "nixfmt" ];
        markdown = [ "prettier" ];
        yaml = [ "yamlfmt" ];
        json = [ "fixjson" ];
      };
    };
  };
}
