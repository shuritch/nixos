{ lib, config, ... }:

let cfg = config.my.boot;
in {
  options.my.boot = {
    tmpOnTmpfs = lib.mkEnableOption "`/tmp` living on tmpfs.";
  };

  config.boot = {
    tmp = {
      useTmpfs = cfg.tmpOnTmpfs; # If not using tmpf 👇, we must clean
      cleanOnBoot = lib.mkDefault (!config.boot.tmp.useTmpfs);
      tmpfsHugeMemoryPages = "within_size";
      # tmpfsSize = mkDefault "75%";
    };
  };
}
