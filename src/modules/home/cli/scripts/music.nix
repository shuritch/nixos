{ pkgs, config, lib, ... }: {
  home.packages = lib.optionals config.my.home.desktop.enable [
    (pkgs.writeShellApplication {
      runtimeInputs = with pkgs; [ mpv ];
      name = "music-local";
      text = ''
        #!/usr/bin/env bash
        mpv ~/music
      '';
    })
  ];
}
