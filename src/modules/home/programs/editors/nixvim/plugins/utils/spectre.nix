{ lib, config, ... }:

# Search panel
# https://github.com/nvim-pack/nvim-spectre/
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim = lib.mkIf cfg.enable {
    plugins.spectre.enable = true;
    keymaps = [{
      mode = "n";
      key = "<leader>rs";
      action = ":Spectre<CR>";
      options = {
        desc = "Spectre toggle";
        silent = true;
      };
    }];
  };
}
