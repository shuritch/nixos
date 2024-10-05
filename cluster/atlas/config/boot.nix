{ pkgs, ... }: {
  my.boot = {
    loader = "grub";
    grubTheme = pkgs.grub-custom-fallout-theme;
    kernel = pkgs.linuxKernel.packages.linux_xanmod_latest;
    emulatedSystems = [ "aarch64-linux" "i686-linux" ];
    initrd.optimizeCompressor = true;
    initrd.enableTweaks = true;
    kernelTweaks = true;
  };
}
