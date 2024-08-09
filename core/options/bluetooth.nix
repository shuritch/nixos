{ pkgs, ... }: {
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        ControllerMode = "bredr";
        Experimental = true;
        AutoEnable = true;
      };
    };
  };

  environment.systemPackages =
    builtins.attrValues { inherit (pkgs) bluez bluez-tools; };
}
