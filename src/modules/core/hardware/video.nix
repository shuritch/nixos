{ lib, config, myLib, pkgs, ... }: {
  config = lib.mkIf (myLib.testHM config "desktop.enable") {
    services.xserver.enable = true;
    hardware.graphics = {
      enable = true;
      enable32Bit = pkgs.stdenv.hostPlatform.isLinux
        && pkgs.stdenv.hostPlatform.isx86;
    };
  };
}
