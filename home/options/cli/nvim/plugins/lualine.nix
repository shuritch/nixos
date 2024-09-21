{ config, ... }:
let colors = import ../../colors/${config.theme}.nix { };
in {
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
        disabled_filetypes.statusline = [ "dashboard" "alpha" "starter" ];
        theme.normal = {
          a.bg = "#nil";
          b.bg = "nil";
          c.bg = "nil";
          z.bg = "nil";
          y.bg = "nil";
        };
      };

      inactive_sections.lualine_x = [ "filename" "filetype" ];
      sections = {
        lualine_a = [{
          __unkeyed = "mode";
          fmt = "string.lower";
          separator.left = "";
          separator.right = "";
          color = {
            fg = colors.base04;
            bg = "nil";
          };
        }];

        lualine_b = [
          {
            __unkeyed = "branch";
            icon.__unkeyed = "";
            separator.left = "";
            separator.right = "";
            color = {
              fg = colors.base04;
              bg = "nil";
            };
          }
          {
            __unkeyed = "diff";
            separator.left = "";
            separator.right = "";
          }
        ];

        lualine_c = [{
          __unkeyed = "diagnostic";
          separator.left = "";
          separator.right = "";
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
            separator.left = "";
            separator.right = "";
            icon_only = true;
          }
          {
            __unkeyed = "filename";
            separator.left = "";
            separator.right = "";
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
          separator.left = "";
          separator.right = "";
          color = {
            fg = colors.base0B;
            bg = "nil";
          };
        }];
      };
    };
  };
}
