{ lib, ... }: {
  imports = [ ./dev ./headless.nix ];
  options.my.system.roles = lib.mkOption {
    description = "Configuration presets based on the current configuration";
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };
}
