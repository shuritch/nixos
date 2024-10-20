{
  # automatically highlighting other uses of the word under the cursor
  # https://github.com/RRethy/vim-illuminate
  config.programs.nixvim.plugins.illuminate = {
    enable = true;
    underCursor = false;
    filetypesDenylist =
      [ "Outline" "TelescopePrompt" "alpha" "harpoon" "reason" ];
  };
}
