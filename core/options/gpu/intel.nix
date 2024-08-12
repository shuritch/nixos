{ pkgs, ... }: {
  boot.initrd.kernelModules = [ "i915" ];
  services.xserver.videoDrivers = [ "modesetting" ];
  environment.variables.VDPAU_DRIVER = "va_gl";
  hardware.intel-gpu-tools.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [
      pkgs.intel-compute-runtime
      pkgs.intel-media-driver
      pkgs.vaapiVdpau
      pkgs.libvdpau-va-gl
      pkgs.vaapiIntel
    ];

    extraPackages32 = [
      # pkgs.pkgsi686Linux.intel-compute-runtime # FIXME does not build due to unsupported system
      pkgs.pkgsi686Linux.intel-media-driver
      pkgs.pkgsi686Linux.libvdpau-va-gl
      pkgs.pkgsi686Linux.vaapiVdpau
      pkgs.vaapiIntel
    ];
  };

}
