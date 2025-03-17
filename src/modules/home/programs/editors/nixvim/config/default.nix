{ pkgs, lib, config, ... }: {
  imports = [ ./autocmd.nix ./keymaps.nix ./options.nix ./xdg.nix ];
  programs.nixvim = {
    performance.byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };

    clipboard = { # Use system clipboard
      register = "unnamedplus";
      providers.wl-copy = lib.mkIf config.my.home.desktop.isWayland {
        package = pkgs.wl-clipboard;
        enable = true;
      };
    };
  };
}
