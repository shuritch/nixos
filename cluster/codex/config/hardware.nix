{
  my.hardware = {
    bluetooth = true;
    thunderbolt = true;
    input.mouse = true;
    webcam = true;
    audio = true;
    zram = true;

    cpu = "amd";
    gpu = "amd";

    monitors = [
      { # LG 38
        name = "DP-1";
        workspaces = [ "0" "1" "2" "3" "4" ];
        primary = true;
        width = 3840;
        height = 1600;
        refreshRate = 144;
        x = 0;
        y = 0;
      }
      { # LG 38
        name = "DP-2";
        workspaces = [ "5" "6" "7" "8" "9" ];
        width = 3840;
        height = 1600;
        refreshRate = 144;
        x = 0;
        y = -1600;
      }
      { # Asus 27
        name = "HDMI-A-1";
        workspaces = [ "F1" "F2" "F3" "F4" "F5" "F6" "F7" "F8" "F9" ];
        width = 2560;
        height = 1440;
        refreshRate = 144;
        x = -2560;
        y = 0;
      }
    ];
  };
}
