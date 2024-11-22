{
  imports = [
    ./dressing.nix
    ./indent-blankline.nix
    ./lualine.nix
    ./noice.nix
    ./smart-splits.nix
    ./telescope.nix
  ];

  programs.nixvim.plugins = {
    # precognition.enable = true; # Motions | https://github.com/tris203/precognition.nvim/
  };
}
