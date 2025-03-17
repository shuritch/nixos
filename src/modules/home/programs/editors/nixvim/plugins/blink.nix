{ config, pkgs, ... }: {
  config.programs.nixvim.extraPackages = with pkgs; [ gh ];
  config.programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    blink-cmp-copilot
    blink-ripgrep-nvim
  ];

  config.programs.nixvim.plugins = {
    blink-cmp-copilot.enable =
      !config.programs.nixvim.plugins.blink-copilot.enable;
    blink-cmp-dictionary.enable = true;
    blink-cmp-spell.enable = true;
    blink-copilot.enable = true;
    blink-cmp-git.enable = true;
    blink-emoji.enable = true;
    blink-ripgrep.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings = {
        keymap.preset = "super-tab";
        signature.enabled = true;
        sources = {
          default = [
            "buffer"
            "lsp"
            "path"
            "snippets"
            # Community
            "copilot"
            "dictionary"
            "emoji"
            "git"
            "spell"
            "ripgrep"
          ];

          providers = {
            ripgrep = {
              name = "Ripgrep";
              module = "blink-ripgrep";
              score_offset = 1;
              opts = {
                prefix_min_len = 3;
                context_size = 5;
                max_filesize = "1M";
                project_root_marker = ".git";
                project_root_fallback = true;
                search_casing = "--ignore-case";
                additional_rg_options = { };
                fallback_to_regex_highlighting = true;
                ignore_paths = { };
                additional_paths = { };
                debug = false;
              };
            };

            dictionary = {
              name = "Dict";
              module = "blink-cmp-dictionary";
              min_keyword_length = 3;
            };

            emoji = {
              name = "Emoji";
              module = "blink-emoji";
              score_offset = 1;
            };

            copilot = {
              name = "copilot";
              module = "blink-copilot";
              async = true;
              score_offset = 100;
            };

            lsp.score_offset = 4;
            spell = {
              name = "Spell";
              module = "blink-cmp-spell";
              score_offset = 1;
            };

            git = {
              module = "blink-cmp-git";
              name = "git";
              score_offset = 100;
              opts = {
                commit = { };
                git_centers = { git_hub = { }; };
              };
            };
          };
        };

        appearance = {
          nerd_font_variant = "mono";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
            Error = "󰏭";
            Warning = "󰏯";
            Information = "󰏮";
            Hint = "󰏭";

            Emoji = "🤣";
          };
        };

        completion = {
          trigger = { show_in_snippet = false; };
          accept = { auto_brackets = { enabled = false; }; };
          documentation = {
            auto_show = true;
            window = { border = "single"; };
          };

          menu = {
            border = "none";
            draw = {
              gap = 1;
              treesitter = [ "lsp" ];
              columns = [
                { __unkeyed-1 = "label"; }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
                { __unkeyed-1 = "source_name"; }
              ];
            };
          };
        };
      };
    };
  };
}
