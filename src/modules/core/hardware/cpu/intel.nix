{ config, lib, ... }:

let cfg = config.my.hardware;
in {
  config = lib.mkIf (cfg.cpu == "intel" || cfg.cpu == "vm-intel") {
    boot.kernelParams = [ "i915.fastboot=1" "enable_gvt=1" ];
    hardware.cpu.intel.updateMicrocode = true;
    boot.kernelModules = [ "kvm-intel" ];
  };
}
