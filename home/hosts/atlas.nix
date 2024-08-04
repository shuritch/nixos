{ pkgs, ... }: {
  imports = [ ../desktop/hyprland ../default.nix ];
  wallpaper = pkgs.wallpapers.ship-art-dark;
  monitors = [
    {
      name = "HDMI-A-4"; # BENQ
      width = 2560;
      height = 1440;
      x = 0;
      y = 804;
      workspace = "3";
    }
    {
      name = "HDMI-A-3"; # DELL WE
      width = 3440;
      height = 1440;
      x = 2560;
      y = 0;
      workspace = "1";
      primary = true;
    }
    {
      name = "HDMI-A-5"; # DELL W
      width = 3440;
      height = 1440;
      x = 2560;
      y = 1440;
      workspace = "2";
      rotate = 2;
    }
  ];
}
