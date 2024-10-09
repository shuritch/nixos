{ pkgs, lib, config, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware.bluetooth = lib.mkEnableOption "Enable Bluetooth support";
  config = lib.mkIf cfg.bluetooth {
    boot.kernelParams = [ "btusb" ];
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      package = pkgs.bluez;
      disabledPlugins = [ "sap" ];
      settings.General = {
        JustWorksRepairing = "always";
        MultiProfile = "multiple";
        KernelExperimental = true;
        Experimental = true;
        AutoEnable = true;
      };
    };
  };
}
