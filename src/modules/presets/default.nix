{ lib, myLib, ... }: {
  imports = [ ./roles ./classes ];

  options.my.system.roles = lib.mkOption {
    description = "Configuration presets based on the current configuration";
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };

  options.my.system.class = lib.mkOption {
    default = null;
    description = "Class of device";
    type = lib.types.enum myLib.DEVICE_LIST;
  };
}
