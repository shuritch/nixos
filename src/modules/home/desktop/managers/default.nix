{ lib, ... }: {
  imports = [ ./hyprland ];
  options.my.home.desktop.manager = lib.mkOption {
    description = "Choose preferred desktop manager";
    type = lib.types.nullOr (lib.types.enum [ "hyprland" ]);
    default = null;
  };
}
