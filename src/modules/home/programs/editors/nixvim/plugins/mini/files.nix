{
  config.programs.nixvim = {
    # File explorer
    plugins.mini.modules.files = {
      windows = {
        preview = true;
        width_preview = 100;
      };
      content.filter.__raw = ''
        function(entry)
          return entry.name ~= '.git' and entry.name ~= '.direnv' and entry.name ~= '.envrc' and entry.name ~= '.gitlab' and entry.name ~= '.github'
        end'';
    };

    keymaps = [
      {
        mode = "n";
        key = "-";
        action = ":lua  MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>";
        options = {
          desc = "Open file explorer cwd";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "_";
        action = ":lua  MiniFiles.open()<CR>";
        options = {
          desc = "Open file explorer";
          silent = true;
        };
      }
    ];
  };
}
