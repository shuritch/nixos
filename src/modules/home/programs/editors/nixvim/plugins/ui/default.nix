{
  imports = [
    ./alpha.nix
    ./bufferline.nix
    ./dressing.nix
    ./noice.nix
    ./notify.nix
    ./smart-splits.nix
    ./telescope.nix
  ];

  programs.nixvim = {
    # https://github.com/tris203/precognition.nvim/
    plugins.precognition.enable = true; # Motions
    # https://github.com/lukas-reineke/indent-blankline.nvim/
    plugins.indent-blankline.enable = true;
  };
}
