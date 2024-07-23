{ pkgs, config, ... }: {
  boot = {
    kernelModules = [ ];
    extraModulePackages = [ ];
    kernelParams = [
      "quiet"
      "loglevel=3"
      "systemd.show_status=auto"
      "udev.log_level=3"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
      "psmouse.synaptics_intertouch=0"
    ];

    initrd = {
      verbose = false;
      kernelModules = [ ];
      availableKernelModules =
        [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    };

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        configurationLimit = 25;
      };
    };

    console = {
      useXkbConfig = true;
      earlySetup = false;
    };

    consoleLogLevel = 0;
    plymouth = {
      enable = true;
      theme = "spinner-monochrome";
      themePackages = [
        (pkgs.plymouth-spinner-monochrome.override {
          inherit (config.boot.plymouth) logo;
        })
      ];
    };
  };
}
