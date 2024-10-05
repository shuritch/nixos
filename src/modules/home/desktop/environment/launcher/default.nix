{ lib, ... }: {
  imports = [ ./wofi.nix ];
  options.my.home.desktop.launcher = lib.mkOption {
    description = "Choose your application launcher";
    type = lib.types.nullOr (lib.types.enum [ "wofi" ]);
    default = null;
  };
}
