{ config, lib, pkgs, ... }:

# AI Chat
# https://github.com/olimorris/codecompanion.nvim
let cfg = config.programs.nixvim;
in {
  config = lib.mkIf cfg.enable {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "codecompanion";
        version = "v2.2.0";
        src = pkgs.fetchFromGitHub {
          owner = "olimorris";
          repo = "codecompanion.nvim";
          rev = "refs/tags/v2.2.0";
          hash = "sha256-VD3jI48H4n60aHzs8tf0FaZ+TRecjik78i71Yv+xVyY=";
        };
      })
    ];

    extraConfigLua = ''
      require("codecompanion").setup({
         strategies = {
           chat = {
             adapter = "anthropic",
           },
           inline = {
             adapter = "anthropic",
           },
           agent = {
             adapter = "anthropic",
           },
         },
      });
    '';

    keymaps = [
      {
        mode = [ "n" "v" ];
        key = "<leader>a";
        action = "CodeCompanion";
        options = {
          silent = true;
          desc = "+codecompanion";
        };
      }
      {
        key = "<leader>ac";
        action = ":CodeCompanionToggle<CR>";
        mode = "n";
        options = {
          silent = true;
          desc = "Toggle CodeCompanion";
        };
      }
      {
        key = "<leader>af";
        action = ":CodeCompanionActions<CR>";
        mode = "n";
        options = {
          silent = true;
          desc = "CodeCompanion Actions";
        };
      }
    ];
  };
}
