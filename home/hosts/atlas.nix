{ pkgs, ... }: {
  imports = [
    ../desktop/hyprland
    ../options/coding.nix
    ../options/gaming.nix
    ../default.nix
  ];

  wallpaper = pkgs.wallpapers.windows-dark-purple;
  monitors = [
    {
      name = "HDMI-0"; # BENQ
      width = 2560;
      height = 1440;
      x = 0;
      y = 804;
      workspace = "1";
    }
    {
      name = "HDMI-1"; # DELL WE
      width = 3440;
      height = 1440;
      x = 2560;
      y = 0;
      workspace = "2";
      primary = true;
    }
    {
      name = "HDMI-2"; # DELL W
      width = 3440;
      height = 1440;
      x = 2560;
      y = 1440;
      workspace = "3";
    }
  ];
}
