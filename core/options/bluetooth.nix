{ pkgs, ... }: {
  # boot.kernelParams = [ "btusb" ];
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez5-experimental;
    disabledPlugins = [ "sap" ];
    settings.General = {
      # Enable = "Source,Sink,Media,Socket";
      # ControllerMode = "bredr";
      JustWorksRepairing = "always";
      MultiProfile = "multiple";
      KernelExperimental = true;
      Experimental = true;
      AutoEnable = true;
    };
  };
}
