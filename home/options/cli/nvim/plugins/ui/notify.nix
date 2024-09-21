{
  plugins.notify = {
    enable = false;
    backgroundColour = "#000000";
    fps = 60;
    render = "default";
    timeout = 1000;
    topDown = false;
  };

  keymaps = [{
    mode = "n";
    key = "<leader>un";
    options.desc = "Dismiss All Notifications";
    action = ''
      <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
    '';
  }];
}
