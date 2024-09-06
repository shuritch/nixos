{ lib, pkgs, ... }: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    grub = {
      enable = true;
      device = "nodev";
      configurationLimit = 25;
      efiSupport = true;
      useOSProber = true;
      theme = lib.mkDefault pkgs.grub-custom-fallout-theme;
    };
  };
}
