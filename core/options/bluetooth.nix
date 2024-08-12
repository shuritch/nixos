{ pkgs, ... }: {
  # boot.kernelParams = [ "btusb" ];
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez5-experimental;
    # disabledPlugins = [ "sap" ];
    settings.General = {
      # Enable = "Source,Sink,Media,Socket";
      JustWorksRepairing = "always";
      MultiProfile = "multiple";
      ControllerMode = "bredr";
      Experimental = true;
      AutoEnable = true;
    };
  };
}
