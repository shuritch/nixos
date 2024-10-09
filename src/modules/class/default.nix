{ lib, myLib, ... }: {
  imports = [ ./global ./wsl ./iso ];
  options.my.system.class = lib.mkOption {
    default = null;
    description = "Class of device";
    type = lib.types.enum myLib.DEVICE_LIST;
  };
}
