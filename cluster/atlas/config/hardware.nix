{
  my.hardware = {
    bluetooth = true;
    thunderbolt = true;
    input.mouse = true;
    webcam = true;
    audio = true;
    zram = true;

    cpu = "intel";
    gpu = "nvidia";

    monitors = [
      { # DELL WE
        name = "HDMI-A-1";
        workspaces = [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ];
        primary = true;
        width = 3440;
        height = 1440;
        x = 0;
        y = 0;
      }
      { # BENQ
        name = "HDMI-A-2";
        workspaces = [ "F1" "F2" "F3" "F4" "F5" "F6" "F7" "F8" "F9" ];
        width = 2560;
        height = 1440;
        x = -2560;
        y = 0;
      }
    ];
  };
}
