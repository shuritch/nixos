{ pkgs, config, ... }: {
  my.system.users.${config.my.system.admin}.home = {
    desktop = {
      enable = true;
      isWayland = true;
      wallpaper = pkgs.wallpaper-ship-in-storm;
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

      exec = [
        "[workspace special silent] kitty"
        "[workspace name:0 silent] thunderbird"
        "[workspace name:0 silent] franz"
        "[workspace 1 silent] silent-code"
        "[workspace 2 silent] firefox-developer-edition"
        ''sleep 2 && echo "connect AC:80:0A:E3:3B:CE" | bluetoothctl''
        "sleep 5; vesktop --start-minimized"
        "telegram-desktop -startintray"
        "thunder -startintray"
      ];
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
      obsidian.enable = true;
      rustdesk.enable = true;
      gimp.enable = true;
    };

    services = {
      kdeconnect.enable = true;
      nix-index.enable = true;
      waypipe.enable = true;
    };
  };
}
