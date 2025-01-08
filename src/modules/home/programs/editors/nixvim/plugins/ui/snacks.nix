{ pkgs, ... }: {
  # https://github.com/folke/snacks.nvim
  config.programs.nixvim = {
    plugins.snacks = {
      enable = true;
      settings = {
        git.enabled = true;
        animate.enabled = true;
        gitbrowse.enabled = true;
        quickfile.enabled = true;
        lazygit.enabled = true;
        rename.enabled = true;
        notify.enabled = true;
        notifier = {
          enabled = true;
          timeout = 3000;
        };

        words = {
          debounce = 100;
          enabled = true;
        };

        dashboard = {
          enabled = true;
          preset.keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = "<leader>ff";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "/";
              desc = "Find Text";
              action = "<leader>fr";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = "<leader>fg";
            }
            {
              icon = "";
              key = "o";
              desc = "LazyGit";
              action = "<leader>gg";
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];

          sections = [
            {
              icon = " ";
              title = "Keymaps";
              section = "keys";
              padding = 1;
              indent = 3;
            }
            {
              icon = " ";
              title = "Recent Files";
              section = "recent_files";
              padding = 1;
              indent = 3;
            }
            {
              icon = " ";
              title = "Projects";
              section = "projects";
              padding = 1;
              indent = 3;
            }
            {
              icon = " ";
              title = "Git Status";
              section = "terminal";
              cmd = "${pkgs.hub}/bin/hub status --short --branch --renames";
              height = 5;
              padding = 1;
              ttl = 5 * 60;
              indent = 3;
              enabled.__raw = ''
                Snacks.git.get_root() ~= nil
              '';
            }
          ];
        };
      };
    };

    autoCmd = [{
      event = "User";
      pattern = "MiniFilesActionRename";
      callback.__raw = ''
        function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end
      '';
    }];

    keymaps = [
      {
        mode = [ "v" "n" ];
        key = "<leader>go";
        action = ":lua Snacks.gitbrowse.open()<CR>";
        options = { desc = "Open git repo"; };
      }
      {
        mode = "n";
        key = "<leader>gg";
        action = ":lua Snacks.lazygit.open()<CR>";
        options = { desc = "Open LazyGit"; };
      }
    ];
  };
}
