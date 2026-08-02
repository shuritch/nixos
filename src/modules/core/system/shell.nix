{ lib, pkgs, ... }:

let
in {
  options.my.system = {
    # Doesn't require options
  };

  config = {
    environment.pathsToLink = [ "/share/bash-completion" "/share/fish" ];
    environment.systemPackages = with pkgs; [ terminfo ];
    environment.shells = [ pkgs.fish ];

    programs.fish = {
      enable = true;
      vendor = {
        completions.enable = true;
        functions.enable = true;
        config.enable = true;
      };
    };

    console = {
      font = "${pkgs.terminus_font}/share/consolefonts/ter-d18n.psf.gz";
      enable = lib.mkDefault true;
      earlySetup = true;
      keyMap = "us";
    };
  };
}
