{ config, ... }:

let inherit (config.my.home.programs.nixvim) colors;
in {
  # https://github.com/nvim-lualine/lualine.nvim/
  config.programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        inactiveSections.lualine_x = [ "filename" "filetype" ];
        disabledFiletypes.statusline =
          [ "dashboard" "alpha" "starter" "snacks_dashboard" ];
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
          separator.right = "";
          separator.left = "";
          color = {
            fg = colors.base04;
            bg = "nil";
          };
        }];

        lualine_b = [
          {
            __unkeyed = "branch";
            icon.__unkeyed = "";
            separator.right = "";
            separator.left = "";
            color = {
              fg = colors.base04;
              bg = "nil";
            };
          }
          {
            __unkeyed = "diff";
            separator.right = "";
            separator.left = "";
          }
        ];

        lualine_c = [{
          __unkeyed = "diagnostic";
          separator.right = "";
          separator.left = "";
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
        }];

        lualine_x = [ "" ];
        lualine_y = [
          {
            __unkeyed = "filetype";
            separator.right = "";
            separator.left = "";
            icon_only = true;
          }
          {
            __unkeyed = "filename";
            separator.right = "";
            separator.left = "";
            symbols = {
              modified = "";
              readonly = "👁️";
              unnamed = "";
            };
            color = {
              fg = colors.base05;
              bg = "nil";
            };
          }
        ];

        lualine_z = [{
          __unkeyed = "location";
          separator.right = "";
          separator.left = "";
          color = {
            fg = colors.base0B;
            bg = "nil";
          };
        }];
      };
    };
  };
}
