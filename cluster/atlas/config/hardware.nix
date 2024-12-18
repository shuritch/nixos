{
  my.hardware = {
    bluetooth = true;
    thunderbolt = true;
    input.mouse = true;
    audio = true;
    zram = true;

    cpu = "intel";
    gpu = "nvidia";

    monitors = [
      { # DELL WE
        name = "HDMI-A-1";
        workspaces = [ "0" "1" ];
        primary = true;
        width = 3440;
        height = 1440;
        x = 0;
        y = 0;
      }
      { # BENQ
        name = "HDMI-A-2";
        workspaces = [ "2" "3" ];
        width = 2560;
        height = 1440;
        x = -2560;
        y = 0;
      }
    ];
  };
}
