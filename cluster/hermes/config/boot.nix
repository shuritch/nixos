{ pkgs, ... }: {
  my.boot = {
    loader = "systemd-boot";
    kernel = pkgs.linuxKernel.packages.linux_xanmod_latest;
    emulatedSystems = [ "aarch64-linux" "i686-linux" ];
    initrd.optimizeCompressor = false;
    initrd.enableTweaks = true;
    kernelTweaks = true;
    silentBoot = true;
    plymouth = {
      enable = true;
      theme = "fallout";
      themePackage = pkgs.plymouth-custom-fallout-theme;
    };
  };
}
