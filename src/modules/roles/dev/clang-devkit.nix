{ pkgs, lib, myRoles, ... }:

lib.optionalAttrs (builtins.elem "clang-devkit" myRoles) {
  programs.ccache = {
    enable = true;
    cacheDir = "/var/cache/sccache";
  };

  environment.systemPackages = with pkgs; [
    gcc
    cmake
    gnumake

  ];
}
