{ lib, config, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware = {
    # Defined in ./default.nix
  };

  config = lib.mkIf (cfg.cpu == "amd" || cfg.cpu == "vm-amd") {
    boot.kernelModules = [ "kvm-amd" "amd-pstate" ];
    hardware.cpu.amd.updateMicrocode = true;
  };
}
