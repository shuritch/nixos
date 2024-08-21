{ pkgs, config, lib, ... }: {
  console = {
    useXkbConfig = true;
    earlySetup = false;
  };

  boot = {
    loader.timeout = 0;
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "loglevel=3"
      "systemd.show_status=auto"
      "udev.log_level=3"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
    ];

    plymouth = {
      enable = true;
      theme = lib.mkDefault "arch";
      themePackages = [
        pkgs.plymouth-themes.fallout
        pkgs.plymouth-themes.kali
        pkgs.plymouth-themes.arch
        (pkgs.plymouth-themes.spinner-monochrome.override {
          inherit (config.boot.plymouth) logo;
        })
      ];
    };
  };
}
