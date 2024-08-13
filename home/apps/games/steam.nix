{ pkgs, lib, config, ... }:
let
  monitor = lib.head (lib.filter (m: m.primary) config.monitors);
  steam = lib.concatStringsSep " " [ "steam" "steam://open/bigpicture" ];
  steam-with-pkgs = pkgs.steam.override {
    extraPkgs = pkgs: [
      pkgs.xorg.libXcursor
      pkgs.xorg.libXi
      pkgs.xorg.libXinerama
      pkgs.xorg.libXScrnSaver
      pkgs.libpng
      pkgs.libpulseaudio
      pkgs.libvorbis
      pkgs.stdenv.cc.cc.lib
      pkgs.libkrb5
      pkgs.keyutils
      pkgs.gamescope
      pkgs.mangohud
    ];
  };
  steam-session = let
    gamescope = lib.concatStringsSep " " [
      (lib.getExe pkgs.gamescope)
      "--output-width ${toString monitor.width}"
      "--output-height ${toString monitor.height}"
      "--framerate-limit ${toString monitor.refreshRate}"
      "--prefer-output ${monitor.name}"
      "--adaptive-sync"
      "--expose-wayland"
      "--hdr-enabled"
      "--steam"
    ];
  in pkgs.writeTextDir "share/wayland-sessions/steam-sesson.desktop" # ini

  ''
    [Desktop Entry]
    Name=Steam Session
    Exec=${gamescope} -- ${steam}
    Type=Application
  '';
in {
  home.packages = [
    steam-with-pkgs
    steam-session
    pkgs.gamescope
    pkgs.mangohud
    pkgs.protontricks
  ];
}
