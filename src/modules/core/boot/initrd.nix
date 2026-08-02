{ lib, config, myLib, ... }:

let cfg = config;
in {
  options.my.boot = {
    # Doesn't require options
  };

  config.boot = {
    initrd = lib.mkMerge [
      (lib.singleton {
        systemd.enable = true; # enable systemd in initrd (experimental)
        verbose = false; # removes only the mandatory messages by NixOS
      })

      (lib.mkIf (myLib.isDesktop cfg) {
        compressorArgs = [ "-19" "-T0" ];
        compressor = "zstd";
      })
    ];
  };
}
