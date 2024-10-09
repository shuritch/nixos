{ config, lib, ... }:

let cfg = config.my.network;
in {
  options.my.network.blocker.enable = lib.mkEnableOption "Enable stevenblack.";
  config.networking.stevenblack = lib.mkIf cfg.blocker.enable {
    enable = true;
    block = [
      # "social"
      "fakenews"
      "gambling"
      "porn"
    ];
  };
}

# sasha ivanov
