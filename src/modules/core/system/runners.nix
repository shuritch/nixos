{ pkgs, ... }:

let
in {
  options.my.system = {
    # Doesn't require options
  };

  config = {
    environment.systemPackages = with pkgs; [ comma ];

    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        openssl
        curl
        glib
        glibc
        util-linux
        iculibunwind
        libuuid
        zlib
        libsecret
        freetype
        libglvnd
        libnotify
        sdl3
        vulkan-loader
        gdk-pixbuf
        libx11
        stdenv.cc.cc
      ];
    };
  };
}
