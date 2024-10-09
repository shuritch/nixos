{ config, lib, ... }:

# https://github.com/onsails/lspkind.nvim
let cfg = config.programs.nixvim;
in {
  programs.nixvim.plugins.lspkind = lib.mkIf cfg.enable {
    enable = true;
    symbolMap = {
      Copilot = "";
      TabNine = "";
      Namespace = "󰌗";
      Text = "󰊄";
      Method = "󰆧";
      Function = "󰡱";
      Constructor = "";
      Field = "󰜢";
      Variable = "󰀫";
      Class = "󰠱";
      Interface = "";
      Module = "󰕳";
      Property = "";
      Unit = "󰑭";
      Value = "󰎠";
      Enum = "";
      Keyword = "󰌋";
      Snippet = "";
      Color = "󰏘";
      File = "󰈚";
      Reference = "󰈇";
      Folder = "󰉋";
      EnumMember = "";
      Constant = "󰏿";
      Struct = "󰙅";
      Event = "";
      Operator = "󰆕";
      TypeParameter = "";
      Table = "";
      Object = "󰅩";
      Tag = "";
      Array = "[]";
      Boolean = "";
      Number = "";
      Null = "󰟢";
      String = "󰉿";
      Calendar = "";
      Watch = "󰥔";
      Package = "";
      Codeium = "";
    };

    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
