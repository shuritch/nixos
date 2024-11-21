{ lib, config, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware.zram = lib.mkEnableOption "Enable ZRAM.";
  config = lib.mkIf cfg.zram {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 90; # Instead of 50
      priority = 999;
    };

    boot.kernel.sysctl = {
      # zram is relatively cheap, prefer swap
      "vm.swappiness" = 180;
      "vm.watermark_boost_factor" = 0;
      "vm.watermark_scale_factor" = 125;
      # zram is in memory, no need to readahead
      "vm.page-cluster" = 0;
    };
  };
}
