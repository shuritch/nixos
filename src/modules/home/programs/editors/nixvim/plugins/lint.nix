{ lib, pkgs, ... }: {
  # https://github.com/mfussenegger/nvim-lint/
  programs.nixvim.plugins.lint = {
    enable = true;

    lazyLoad.settings.event = "DeferredUIEnter";

    lintersByFt = {
      bash = [ "shellcheck" ];
      fish = [ "fish" ];
      go = [ "golangcilint" ];
      json = [ "jsonlint" ];
      lua = [ "luacheck" ];
      markdown = [ "markdownlint" ];
      nix = [ "deadnix" "nix" "statix" ];
      sh = [ "shellcheck" ];
      terraform = [ "tflint" ];
      yaml = [ "yamllint" ];
      typescript = [ "eslint_d" ];
      javascript = [ "eslint_d" ];
      css = [ "stylelint" ];
    };

    linters = {
      eslint_d.cmd = lib.getExe pkgs.eslint_d;
      stylelint.cmd = lib.getExe pkgs.stylelint;
      checkmake.cmd = lib.getExe pkgs.checkmake;
      deadnix.cmd = lib.getExe pkgs.deadnix;
      fish.cmd = lib.getExe pkgs.fish;
      golangcilint.cmd = lib.getExe pkgs.golangci-lint;
      jsonlint.cmd = lib.getExe pkgs.nodePackages.jsonlint;
      luacheck.cmd = lib.getExe pkgs.luaPackages.luacheck;
      markdownlint.cmd = lib.getExe pkgs.markdownlint-cli;
      pylint.cmd = lib.getExe pkgs.pylint;
      shellcheck.cmd = lib.getExe pkgs.shellcheck;
      sqlfluff.cmd = lib.getExe pkgs.sqlfluff;
      statix.cmd = lib.getExe pkgs.statix;
      terraform.cmd = lib.getExe pkgs.tflint;
      yamllint.cmd = lib.getExe pkgs.yamllint;
    };
  };
}
