{
  services.libinput = {
    enable = true;
    mouse.accelProfile = "adaptive";
    touchpad.accelProfile = "adaptive";
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.variant = "lang";
    xkb.options = "grp:alt_shift_toggle";
    # windowManager.herbstluftwm.enable = true; # Titles ?
    deviceSection = ''Option "TearFree" "True"''; # Vsync ?
  };
}
