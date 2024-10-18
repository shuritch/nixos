{ lib, config, myLib, pkgs, ... }:

let
  isDesktop = myLib.testHM config "desktop.enable";
  isWayland = myLib.testHM config "desktop.isWayland";
in {
  config = lib.mkIf isDesktop {
    services.xserver.enable = !isWayland;
    programs.xwayland.enable = isWayland;
    hardware.graphics = {
      enable = true;
      enable32Bit = pkgs.stdenv.hostPlatform.isLinux
        && pkgs.stdenv.hostPlatform.isx86;
    };
  };
}
