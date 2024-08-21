{ pkgs ? import <nixpkgs> { }, ... }: rec {
  iio-hyprland = pkgs.callPackage ./iio-hyprland { };
  shellcolord = pkgs.callPackage ./shellcolord { };
  hyprbars = pkgs.callPackage ./hyprbars.nix { };

  # My slightly customized plymouth theme, just makes the blue outline white
  plymouth-spinner-monochrome =
    pkgs.callPackage ./plymouth-spinner-monochrome { };

  # My wallpaper collection
  wallpapers = import ./wallpapers { inherit pkgs; };
  allWallpapers =
    pkgs.linkFarmFromDrvs "wallpapers" (pkgs.lib.attrValues wallpapers);

  # And colorschemes based on it
  generateColorscheme = import ./colorschemes/generator.nix { inherit pkgs; };
  colorschemes =
    import ./colorschemes { inherit pkgs wallpapers generateColorscheme; };
  allColorschemes = let
    # This is here to help us keep IFD cached (hopefully)
    combined = pkgs.writeText "colorschemes.json"
      (builtins.toJSON (pkgs.lib.mapAttrs (_: drv: drv.imported) colorschemes));
  in pkgs.linkFarmFromDrvs "colorschemes"
  (pkgs.lib.attrValues colorschemes ++ [ combined ]);
}
