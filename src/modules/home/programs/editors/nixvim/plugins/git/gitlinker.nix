{
  # Shares code by links
  # https://github.com/ruifm/gitlinker.nvim
  config.programs.nixvim.plugins.gitlinker = {
    enable = true;
    callbacks = { "github.com" = "get_github_type_url"; };
  };
}
