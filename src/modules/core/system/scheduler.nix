{ lib, config, pkgs, myLib, ... }:

let cfg = config;
in {
  options.my.system = {
    # Doesn't require options
  };

  # Replaces default task scheduler
  config = lib.mkIf (myLib.testHM cfg "desktop.enable") {
    services.scx = {
      enable = true;
      scheduler = "scx_bpfland";
      package = pkgs.scx.rustscheds;
    };
  };
}
