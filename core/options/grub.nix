{ lib, pkgs, ... }: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      configurationLimit = 25;
      efiSupport = true;
      useOSProber = true;
      theme = lib.mkDefault pkgs.grub-custom-distro-theme;
    };
  };
}
