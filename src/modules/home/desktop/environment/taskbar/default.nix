{ lib, ... }: {
  imports = [ ./waybar ];
  options.my.home.desktop.taskbar = lib.mkOption {
    description = "Choose your preferred taskbar";
    type = lib.types.nullOr (lib.types.enum [ "waybar" ]);
    default = null;
  };
}
