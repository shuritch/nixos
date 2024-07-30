{
  boot.initrd.systemd.enable = true; # ?
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      consoleMode = "max";
      configurationLimit = 25;
    };
  };
}
