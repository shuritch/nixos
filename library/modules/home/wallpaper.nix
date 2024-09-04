{ lib, ... }:

with lib; {
  options.wallpaper = mkOption {
    type = types.nullOr types.path;
    description = "Wallpaper path";
    default = null;
  };
}
