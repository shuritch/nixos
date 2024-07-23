{ env-config, ... }: {
  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.variant = "workman,";
    xkb.options = "grp:alt_shift_toggle";
    videoDrivers = [ "nvidia" ];
    windowManager.herbstluftwm.enable = true; # ?
    deviceSection = ''Option "TearFree" "True"''; # ?

    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };
  };
}
