{ lib, config, myLib, ... }: {
  config.programs = lib.mkIf (myLib.testHM config "desktop.enable") {
    nm-applet.enable = !(myLib.checkHM config "desktop.taskbar" "waybar");
    adb.enable = true;
    bandwhich.enable = true;
    dconf.enable = true;
  };
}
