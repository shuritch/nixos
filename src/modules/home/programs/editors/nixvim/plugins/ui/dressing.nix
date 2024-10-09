{
  # https://github.com/stevearc/dressing.nvim/
  programs.nixvim.plugins.dressing = {
    enable = true;
    settings = {
      input.relative = "win";
      select.backend = [ "telescope" ];
    };
  };
}
