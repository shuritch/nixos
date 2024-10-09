{ lib, myLib, config, ... }: {
  my.hardware = {
    bluetooth = lib.mkDefault (myLib.isSuitablePC config);
    thunderbolt = lib.mkDefault (myLib.isSuitablePC config);
    battery.enable = lib.mkDefault (myLib.isPC config);
    lid = lib.mkDefault (myLib.isSuitablePC config);
    audio = lib.mkDefault (myLib.isPC config);
    zram = lib.mkDefault (myLib.isPC config);

    input = {
      mouse = lib.mkDefault (myLib.isPC config);
      touchscreen = lib.mkDefault (myLib.isSuitablePC config);
      gyroscope = lib.mkDefault (myLib.isSuitablePC config);
    };

    monitors = lib.mkDefault (if myLib.isSuitablePC config then [{
      name = lib.mkDefault "eDP-1";
      width = lib.mkDefault 1920;
      height = lib.mkDefault 1080;
      primary = lib.mkDefault true;
      workspaces = lib.mkDefault [ "1" ];
      scale = lib.mkDefault 1;
    }] else
      [ ]);
  };
}
