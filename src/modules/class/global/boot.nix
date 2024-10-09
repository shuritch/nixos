{ lib, myLib, config, pkgs, ... }: {
  my.boot = {
    initrd.optimizeCompressor = lib.mkDefault (myLib.isPC config);
    initrd.enableTweaks = lib.mkDefault (!(myLib.isSubsystem config));
    kernelTweaks = lib.mkDefault (!(myLib.isSubsystem config));
    silentBoot = lib.mkDefault config.my.boot.plymouth.enable;

    plymouth = lib.optionalAttrs (myLib.isSuitablePC config) {
      themePackage = lib.mkDefault pkgs.plymouth-custom-arch-theme;
      theme = lib.mkDefault "arch";
      enable = lib.mkDefault true;
    };

    grubTheme = lib.mkDefault (if config.my.boot.loader == "grub" then
      pkgs.grub-custom-fallout-theme
    else
      null);

    loader = lib.mkDefault (if myLib.isSuitablePC config then
      "systemd-boot"
    else if myLib.isPC config then
      "grub"
    else
      "none");
  };
}
