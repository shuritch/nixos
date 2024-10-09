{ pkgs, config, ... }:
[ (pkgs.callPackage ./theme.nix { } config.my.home.colorscheme) ]
