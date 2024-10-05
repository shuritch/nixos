{ lib, ... }: {
  options.my.home.desktop.wallpaper = lib.mkOption {
    type = lib.types.nullOr lib.types.path;
    description = "Wallpaper path";
    default = null;
  };
}
