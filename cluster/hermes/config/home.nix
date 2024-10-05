{ pkgs, config, ... }: {
  my.system.users.${config.my.system.admin}.home = {
    desktop = {
      enable = true;
      isWayland = true;
      wallpaper = pkgs.wallpaper-tropical-paradise;
      manager = "hyprland";
      locker = "swaylock";
      explorer = "thunar";
      taskbar = "waybar";
      terminal = "kitty";
      launcher = "wofi";
      notifier = "mako";
      idle = "swayidle";

      fonts = {
        monospace.size = 14;
        regular.size = 14;
      };
    };

    cli = {
      enableTweaks = true;
      enableGitTweaks = true;
      enableScripts = true;
      shell.type = "fish";
    };

    programs = {
      # Editors
      vscode.enable = true;
      nixvim.enable = true;
      micro.enable = true;
      # Browsers
      firefox.enable = true;
      chrome.enable = true;
      # Social
      franz.enable = true;
      discord.enable = true;
      thunderbird.enable = true;
      telegram.enable = true;
      # Documents
      libreoffice.enable = true;
      zathura.enable = true;
      # Media
      oculante.enable = true;
      mpv.enable = true;
      # Dev
      postman.enable = true;
      # Other
      gparted.enable = true;
      obsidian.enable = true;
      rustdesk.enable = true;
      gimp.enable = true;
    };

    services = {
      nix-index.enable = true;
      waypipe.enable = true;
    };
  };
}