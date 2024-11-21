{
  # The best git TUI, as a neovim plugin
  # https://github.com/kdheepak/lazygit.nvim
  config.programs.nixvim = {
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
