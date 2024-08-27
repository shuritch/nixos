{ pkgs, ... }: {
  fontProfiles = {
    enable = true;
    monospace = {
      name = "FiraCode Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
    };

    regular = {
      name = "Fira Sans";
      package = pkgs.fira;
    };

    extra = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      noto-fonts-emoji
    ];
  };
}
