{ config, lib, ... }:

# Shares code by links
# https://github.com/ruifm/gitlinker.nvim
let cfg = config.programs.nixvim;
in {
  programs.nixvim.plugins.gitlinker = lib.mkIf cfg.enable {
    enable = true;
    callbacks = { "github.com" = "get_github_type_url"; };
  };
}
