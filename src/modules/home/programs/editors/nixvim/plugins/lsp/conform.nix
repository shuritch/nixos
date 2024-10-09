{ config, lib, ... }:

# Formatter
# https://github.com/stevearc/conform.nvim/
let cfg = config.programs.nixvim;
in {
  programs.nixvim.plugins.conform-nvim = lib.mkIf cfg.enable {
    enable = true;
    settings = {
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
      };

      notifyOnError = true;
      formatters_by_ft = {
        liquidsoap = [ "liquidsoap-prettier" ];
        html = [[ "prettierd" "prettier" ]];
        css = [[ "prettierd" "prettier" ]];
        javascript = [[ "prettierd" "prettier" ]];
        javascriptreact = [[ "prettierd" "prettier" ]];
        typescript = [[ "prettierd" "prettier" ]];
        typescriptreact = [[ "prettierd" "prettier" ]];
        svelte = [[ "prettierd" "prettier" ]];
        python = [ "black" ];
        toml = [ "taplo" ];
        lua = [ "stylua" ];
        sh = [ "shfmt" ];
        nix = [ "nixfmt" ];
        markdown = [[ "prettierd" "prettier" ]];
        yaml = [ "yamllint" "yamlfmt" ];
        json = [ "fixjson" ];
        "*" = [ "codespell" ];
        "_" = [ "trim_whitespace" ];
      };
    };
  };
}
