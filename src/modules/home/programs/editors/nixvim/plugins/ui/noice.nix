{
  # https://github.com/folke/noice.nvim
  programs.nixvim.plugins.noice = {
    enable = true;

    notify = {
      enabled = false;
      view = "notify";
    };

    messages = {
      enabled = true;
      view = "mini";
    };

    lsp = {
      message.enabled = true;
      progress = {
        enabled = false;
        view = "mini";
      };
    };

    popupmenu = {
      enabled = true;
      backend = "nui";
    };

    format = {
      filter = {
        icon = "";
        lang = "regex";
        pattern = [
          ":%s*%%s*s:%s*"
          ":%s*%%s*s!%s*"
          ":%s*%%s*s/%s*"
          "%s*s:%s*"
          ":%s*s!%s*"
          ":%s*s/%s*"
        ];
      };

      replace = {
        icon = "󱞪";
        lang = "regex";
        pattern = [
          ":%s*%%s*s:%w*:%s*"
          ":%s*%%s*s!%w*!%s*"
          ":%s*%%s*s/%w*/%s*"
          "%s*s:%w*:%s*"
          ":%s*s!%w*!%s*"
          ":%s*s/%w*/%s*"
        ];
      };
    };
  };
}
