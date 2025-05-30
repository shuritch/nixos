{ pkgs, config, ... }: {
  my.system.users.${config.my.system.admin}.home = {
    colorscheme = {
      source = pkgs.wallpaper-tropical-paradise;
      type = "fruit-salad";
      mode = "dark";
    };

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
    };

    cli = {
      enableTweaks = true;
      enableGitTweaks = true;
      enableScripts = true;
      shell.type = "fish";
    };

    programs = {
      libreoffice.enable = true;
      firefox.enable = true;
      discord.enable = true;
      telegram.enable = true;
      vscode.enable = true;
      nixvim.enable = true;
      chrome.enable = true;
      slack.enable = true;
      zathura.enable = true;
      oculante.enable = true;
      postman.enable = true;
      fortivpn.enable = true;
      micro.enable = true;
      gimp.enable = true;
      mpv.enable = true;
    };

    services = {
      battery-alert.enable = true;
      polkit-agent.enable = true;
      nix-index.enable = true;
      waypipe.enable = true;
    };
  };
}
