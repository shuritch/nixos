{ config, ... }:

# Dashboard
# https://github.com/goolord/alpha-nvim
let inherit (config.my.home.programs.nixvim) colors;
in {
  programs.nixvim = {
    plugins.alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 4;
        }
        {
          val = [
            " ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗ "
            " ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║ "
            " ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║ "
            " ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║ "
            " ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║ "
            " ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ "
            "            github:shuritch/nixos             "
          ];
          type = "text";
          opts = {
            hl = "AlphaHeader";
            position = "center";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = let
            mkButton = shortcut: cmd: val: hl: {
              type = "button";
              inherit val;
              opts = {
                inherit hl shortcut;
                keymap = [ "n" shortcut cmd { } ];
                position = "center";
                cursor = 0;
                width = 40;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            };
          in [
            (mkButton "f"
              "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>"
              "🔍 Find File" "Operator")
            (mkButton "n" ":ene <BAR> startinsert <CR>" "📁 New File" "Operator")
            (mkButton "r" ":Telescope oldfiles <CR>" "📜 Recent Files"
              "Operator")
            (mkButton "g" "<CMD>LazyGit<CR>" " Open LazyGit" "Constant")
            (mkButton "q" "<CMD>qa<CR>" "💣 Quit Neovim" "String")
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val = "https://github.com/shuritch/nixos";
          opts = {
            hl = "AlphaFooter";
            position = "center";
          };
        }
      ];
    };

    highlight = {
      AlphaHeader.fg = colors.base0D;
      AlphaFooter.fg = colors.base0F;
    };
  };
}
