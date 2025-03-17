{ pkgs, config, ... }: {
  my.system.users.${config.my.system.admin}.home = {
    colorscheme = {
      source = pkgs.wallpaper-ship-in-storm;
      type = "fruit-salad";
      mode = "dark";
    };

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

      exec = [
        # Trash apps without tray flag
        "[workspace name:0 silent] zapzap; sleep 2; hyprctl dispatch closewindow title:ZapZap"
        "[workspace name:0 silent] thunderbird"
        # Workspace bound apps
        "[workspace special silent] kitty"
        "[workspace 1 silent] silent-code"
        "[workspace name:F2 silent] slack"
        "[workspace name:F1 silent] firefox-developer-edition"
        # XM4 Autoconnect fix
        ''sleep 2 && echo "connect AC:80:0A:E3:3B:CE" | bluetoothctl''
        # Tray apps
        "sleep 5; vesktop --start-minimized"
        "telegram-desktop -startintray"
        "thunder -startintray"
      ];
    };

    cli = {
      enableGitTweaks = true;
      enableScripts = true;
      enableTweaks = true;
      shell.type = "fish";
    };

    programs = {
      libreoffice.enable = true;
      thunderbird.enable = true;
      slack.enable = true;
      firefox.enable = true;
      discord.enable = true;
      telegram.enable = true;
      vscode.enable = true;
      nixvim.enable = true;
      chrome.enable = true;
      zapzap.enable = true;
      zathura.enable = true;
      oculante.enable = true;
      postman.enable = true;
      nekoray.enable = true;
      fortivpn.enable = true;
      micro.enable = true;
      gimp.enable = true;
      mpv.enable = true;
    };

    services = {
      polkit-agent.enable = true;
      kdeconnect.enable = true;
      nix-index.enable = true;
      waypipe.enable = true;
    };
  };
}
