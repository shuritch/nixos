{ pkgs, ... }: {
  my.boot = {
    loader = "grub";
    grubTheme = pkgs.grub-custom-fallout-theme;
    emulatedSystems = [ "aarch64-linux" "i686-linux" ];
    kernel = pkgs.linuxKernel.packages.linux_xanmod_latest;
    kernelTweaks = true;
    tmpOnTmpfs = true;
  };
}
