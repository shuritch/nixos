{ lib, config, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware = {
    # Defined in ./default.nix
  };

  config = lib.mkIf (cfg.cpu == "intel" || cfg.cpu == "vm-intel") {
    boot.kernelParams = [ "i915.fastboot=1" "enable_gvt=1" ];
    hardware.cpu.intel.updateMicrocode = true;
    boot.kernelModules = [ "kvm-intel" ];
  };
}
