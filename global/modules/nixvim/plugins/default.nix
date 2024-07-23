{
  import = [ ./telescope.nix ./lsp.nix ./lualine.nix ./mini.nix ./cmp.nix ];
  programs.nixvim.plugins = {
    nvim-autopairs.enable = true;
    transparent.enable = true;
    which-key.enable = true;

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
      programs.nixvim.plugins.nix.enable = true;
      filesystem.followCurrentFile.enabled = true;
      closeIfLastWindow = true;
    };

    barbar = {
      enable = true;
      keymaps = {
        silent = true;

        next = "<TAB>";
        previous = "<S-TAB>";
        # close = "<C-q>";
      };
    };
  };

  # programs.nixvim.plugins.oil = {
  #   enable = true;
  #   settings = {
  #     view_options.show_hidden = true;
  #     columns = [ "icon" "permissions" "size" "mtime" ];
  #   };
  # };
}
