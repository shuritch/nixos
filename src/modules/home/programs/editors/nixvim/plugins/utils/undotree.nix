{ lib, config, ... }:

# Undo history visualizer
# https://github.com/mbbill/undotree/
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim = lib.mkIf cfg.enable {
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
