{ config, lib, ... }:

# https://github.com/ThePrimeagen/harpoon/tree/harpoon2
let cfg = config.programs.nixvim;
in {
  config.programs.nixvim.plugins.harpoon = lib.mkIf cfg.enable {
    enable = true;
    enableTelescope = true;
    keymapsSilent = true;
    keymaps = {
      addFile = "<leader>ha";
      toggleQuickMenu = "<C-e>";
      navFile = {
        "1" = "<leader>hj";
        "2" = "<leader>hk";
        "3" = "<leader>hl";
        "4" = "<leader>hm";
      };
    };
  };
}
