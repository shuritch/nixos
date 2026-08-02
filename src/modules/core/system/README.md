```nix
let adminUsername = "nixos";
in {
  my.system = {
    docs = true;
    moveFlake = true;
    flakePath = "/etc/nixos/flake";
    timeZone = "Europe/Moscow"; # UTC if server
    defaultLocale = "en_US";
    extraLocales = ["ru_RU"];
    environment = [];
    packages = [];

    admin = adminUsername;
    users.${adminUsername} = {
      email = "nixos-user@noreply.com";
      hashedPassword = null;
      description = "Nixos user";
      extraGroups = [];
      home = {}; # see home
    };

    fonts = {
      monospace = {
        name = "FiraMono Nerd Font";
        package = pkgs.fira-mono;
        size = 14;
      };

      regular = {
        name = "Fira Sans";
        package = pkgs.fira;
        size = 14;
      };

      extra = with pkgs; [
        source-sans
        source-serif
        dejavu_fonts
        inter
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

        twemoji-color-font
        noto-fonts-color-emoji
        material-icons
        material-design-icons
        nerd-fonts.jetbrains-mono
        noto-fonts-emoji
        nerd-fonts.symbols-only
      ];
    };
  };
}
```
