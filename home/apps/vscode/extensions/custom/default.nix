{ pkgs, config, ... }: [ (pkgs.callPackage ./theme.nix { } config.colorscheme) ]
