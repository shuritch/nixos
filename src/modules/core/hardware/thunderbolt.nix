{ lib, config, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware = {
    thunderbolt = lib.mkEnableOption "Enable thunderbolt support." // {
      default = true;
    };
  };

  config = {
    boot.blacklistedKernelModules = lib.optionals (!cfg.thunderbolt) [
      "thunderbolt" # DMA attacks prevention
      "firewire-core"
    ];
  };
}
