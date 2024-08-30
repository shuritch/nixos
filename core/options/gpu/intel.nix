{
  boot.initrd.kernelModules = [ "i915" ];
  services.xserver.videoDrivers = [ "modesetting" ];
  environment.variables.VDPAU_DRIVER = "va_gl";
  hardware.intel-gpu-tools.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
