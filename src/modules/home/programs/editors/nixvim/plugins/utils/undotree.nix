{
  # Undo history visualizer
  # https://github.com/mbbill/undotree/
  config.programs.nixvim = {
    plugins.undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };

    keymaps = [{
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Undotree";
      };
    }];
  };

}
