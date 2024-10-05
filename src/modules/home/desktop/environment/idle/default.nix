{ lib, ... }: {
  options.my.home.desktop.idle = lib.mkOption {
    description = "Choose preferred idle manager";
    type = lib.types.nullOr (lib.types.enum [ "swayidle" ]);
    default = null;
  };
}
