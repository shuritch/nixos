{ config, lib, ... }:

let cfg = config.my.hardware;
in {
  config = lib.mkIf (cfg.cpu == "amd" || cfg.cpu == "vm-amd") {
    boot.kernelModules = [ "kvm-amd" "amd-pstate" ];
    hardware.cpu.amd.updateMicrocode = true;
  };
}
