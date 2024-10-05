{ lib, pkgs, ... }: {
  console = { # Virtual Console
    font = "${pkgs.terminus_font}/share/consolefonts/ter-d18n.psf.gz";
    enable = lib.mkDefault true;
    earlySetup = true;
    keyMap = "us";
  };
}
