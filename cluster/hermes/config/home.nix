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
    };

    cli = {
      enableTweaks = true;
      enableGitTweaks = true;
      enableScripts = true;
      shell.type = "fish";
    };

    programs = {
      nixvim.enable = true;
      firefox.enable = true;
      libreoffice.enable = true;
      zathura.enable = true;
      oculante.enable = true;
      mpv.enable = true;
      postman.enable = true;
      obsidian.enable = true;
      rustdesk.enable = true;
      gimp.enable = true;
    };

    services = {
      battery-alert.enable = true;
      polkit-agent.enable = true;
      nix-index.enable = true;
      waypipe.enable = true;
    };
  };
}
