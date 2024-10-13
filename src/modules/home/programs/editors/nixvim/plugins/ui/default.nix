{
  imports = [
    ./alpha.nix
    # ./bufferline.nix
    ./dressing.nix
    # ./hlchunk.nix
    ./lualine.nix
    ./noice.nix
    # ./notify.nix
    ./smart-splits.nix
    ./telescope.nix
  ];

  programs.nixvim.plugins = {
    # precognition.enable = true; # Motions | https://github.com/tris203/precognition.nvim/
    indent-blankline.enable = true; # lukas-reineke/indent-blankline.nvim
  };
}
