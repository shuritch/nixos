{
  my.hardware = {
    bluetooth = true;
    thunderbolt = true;
    input.mouse = true;
    audio = true;
    zram = true;

    cpu = "intel";
    gpu = "hybrid-nvidia";
    nvidiaPrime = {
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };

    monitors = [
      { # DELL WE
        name = "HDMI-A-3";
        workspaces = [ "0" "1" ];
        primary = true;
        width = 3440;
        height = 1440;
        x = 0;
        y = 0;
      }
      { # BENQ
        name = "HDMI-A-4";
        workspaces = [ "2" "3" ];
        width = 2560;
        height = 1440;
        x = -2560;
        y = 0;
      }
    ];
  };
}
