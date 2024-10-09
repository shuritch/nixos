{ config, ... }:

let inherit (config.my.home.programs.nixvim) colors;
in {
  # https://github.com/nvim-lualine/lualine.nvim/
  config.programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        inactiveSections.lualine_x = [ "filename" "filetype" ];
        disabledFiletypes.statusline = [ "dashboard" "alpha" "starter" ];
        globalstatus = true;
        theme.normal = {
          a.bg = "#nil";
          b.bg = "nil";
          c.bg = "nil";
          z.bg = "nil";
          y.bg = "nil";
        };
      };

      sections = {
        lualine_a = [{
          __unkeyed = "mode";
          fmt = "string.lower";
          color = {
            fg = colors.base04;
            bg = "nil";
          };
          separator.left = "";
          separator.right = "";
        }];

        lualine_b = [
          {
            __unkeyed = "branch";
            icon.__unkeyed = "";
            color = {
              fg = colors.base04;
              bg = "nil";
            };
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "diff";
            separator.left = "";
            separator.right = "";
          }
        ];

        lualine_c = [{
          __unkeyed = "diagnostic";
          symbols = {
            error = " ";
            warn = " ";
            info = " ";
            hint = "󰝶 ";
          };
          color = {
            fg = colors.base08;
            bg = "nil";
          };
          separator.left = "";
          separator.right = "";
        }];

        lualine_x = [ "" ];
        lualine_y = [
          {
            __unkeyed = "filetype";
            icon_only = true;
            separator.left = "";
            separator.right = "";
          }
          {
            __unkeyed = "filename";
            symbols = {
              modified = "";
              readonly = "👁️";
              unnamed = "";
            };
            color = {
              fg = colors.base05;
              bg = "nil";
            };
            separator.left = "";
            separator.right = "";
          }
        ];

        lualine_z = [{
          __unkeyed = "location";
          color = {
            fg = colors.base0B;
            bg = "nil";
          };
          separator.left = "";
          separator.right = "";
        }];
      };
    };
  };
}
