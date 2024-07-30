{
  imports = [ ./telescope.nix ./lsp.nix ./lualine.nix ./mini.nix ./cmp.nix ];
  programs.nixvim.plugins = {
    nvim-autopairs.enable = true;
    transparent.enable = true;
    which-key.enable = true;
    nix.enable = true;

    floaterm = {
      enable = true;
      width = 0.8;
      height = 0.8;
      title = "";
      keymaps.toggle = "<C-b>";
    };

    comment = {
      enable = true;
      settings = {
        opleader.line = "gcc";
        toggler.line = "gcc";
      };
    };

    neo-tree = {
      enable = true;
      filesystem.followCurrentFile.enabled = true;
      closeIfLastWindow = true;
    };

    barbar = {
      enable = true;
      keymaps = {
        next.key = "<TAB>";
        previous.key = "<S-TAB>";
        # close = "<C-q>";
      };
    };
  };
}
