{ config, lib, ... }:

let
  # https://github.com/nvim-lualine/lualine.nvim/
  inherit (config.my.home.colorscheme) base16colors;
  cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.lualine = lib.mkif cfg.enable {
    enable = true;
    globalstatus = true;
    disabledFiletypes.statusline = [ "dashboard" "alpha" "starter" ];
    inactiveSections.lualine_x = [ "filename" "filetype" ];
    theme.normal = {
      a.bg = "#nil";
      b.bg = "nil";
      c.bg = "nil";
      z.bg = "nil";
      y.bg = "nil";
    };

    sections = {
      lualine_a = [{
        name = "mode";
        fmt = "string.lower";
        separator.left = "";
        separator.right = "";
        color = {
          fg = "#${base16colors.base04}";
          bg = "nil";
        };
      }];

      lualine_b = [
        {
          icon = "";
          name = "branch";
          separator.left = "";
          separator.right = "";
          color = {
            fg = "#${base16colors.base04}";
            bg = "nil";
          };
        }
        {
          name = "diff";
          separator.left = "";
          separator.right = "";
        }
      ];

      lualine_c = [{
        name = "diagnostic";
        separator.left = "";
        separator.right = "";
        extraConfig.symbols = {
          error = " ";
          warn = " ";
          info = " ";
          hint = "󰝶 ";
        };

        color = {
          fg = "#${base16colors.base08}";
          bg = "nil";
        };
      }];

      lualine_x = [ "" ];
      lualine_y = [
        {
          name = "filetype";
          extraConfig.icon_only = true;
          separator.left = "";
          separator.right = "";
        }
        {
          name = "filename";
          separator.left = "";
          separator.right = "";
          extraConfig.symbols = {
            modified = "";
            readonly = "👁️";
            unnamed = "";
          };

          color = {
            fg = "#${base16colors.base05}";
            bg = "nil";
          };
        }
      ];

      lualine_z = [{
        name = "location";
        separator.left = "";
        separator.right = "";
        color = {
          fg = "#${base16colors.base0B}";
          bg = "nil";
        };
      }];
    };
  };
}
