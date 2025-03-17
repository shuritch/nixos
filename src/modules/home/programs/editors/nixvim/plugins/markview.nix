{
  # Markdown preview
  # https://github.com/OXY2DEV/markview.nvim/
  config.programs.nixvim.plugins.markview = {
    enable = true;
    settings = {
      buf_ignore = [ ];
      hybrid_modes = [ "i" ];
      modes = [ "n" "i" "no" "c" ];
      callbacks.on_enable.__raw = ''
        function(_, win)
          vim.wo[win].conceallevel = 2
          vim.wo[win].concealcursor = "nc"
        end
      '';
    };
  };
}
