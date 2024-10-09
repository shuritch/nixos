{
  # https://github.com/f-person/git-blame.nvim/
  programs.nixvim = {
    plugins.gitblame = {
      enable = true;
      settings = {
        date_format = "%r";
        delay = 200;
        display_virtual_text = true;
        highlight_group = "Comment";
        message_template = "<summary> • <date> • <author>";
        message_when_not_committed = "Oh please, commit this !";
        use_blame_commit_file_urls = false;
        set_extmark_options.priority = 7;
        virtual_text_column = 80;
      };
    };

    keymaps = [
      {
        mode = [ "n" "v" ];
        key = "<leader>gb";
        action = "gitblame";
        options = {
          silent = true;
          desc = "+blame";
        };
      }
      {
        mode = "n";
        key = "<leader>gbt";
        action = ":GitBlameToggle<CR>";
        options = {
          silent = true;
          desc = "Toggle";
        };
      }
      {
        mode = "n";
        key = "<leader>gbs";
        action = ":GitBlameCopySHA<CR>";
        options = {
          silent = true;
          desc = "Copy SHA";
        };
      }
      {
        mode = "n";
        key = "<leader>gbc";
        action = ":GitBlameCopyFileURL<CR>";
        options = {
          silent = true;
          desc = "Copy URL";
        };
      }
      {
        mode = "n";
        key = "<leader>gbo";
        action = ":GitBlameOpenFileURL<CR>";
        options = {
          silent = true;
          desc = "Open file URL";
        };
      }
    ];
  };
}
