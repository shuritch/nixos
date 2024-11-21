{ lib, ... }: {
  imports = [ ./swaylock.nix ];
  options.my.home.desktop.locker = lib.mkOption {
    description = "Choose preferred screen locker.";
    type = lib.types.nullOr (lib.types.enum [ "swaylock" ]);
    default = null;
  };
}
