{ config, lib, ... }:

# https://github.com/kdheepak/lazygit.nvim
let cfg = config.programs.nixvim;
in {
  config = lib.mkIf cfg.enable {
    plugins.lazygit.enable = true;
    extraConfigLua = ''
      require("telescope").load_extension("lazygit")
    '';

    keymaps = [{
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = { desc = "LazyGit (root dir)"; };
    }];
  };
}
