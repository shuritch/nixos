{ lib, config, ... }:

let cfg = config.my.network;
in {
  options.my.network = {
    blocker.enable = lib.mkEnableOption "Enable stevenblack.";
  };

  config.networking.stevenblack = lib.mkIf cfg.blocker.enable {
    enable = true;
    block = [
      "fakenews"
      # "gambling"
      # "social"
      "porn"
    ];
  };
}
