{ lib, ... }@args:

lib.foldl (a: b: a // b) { } [
  (import ./themes/distro.nix args)
  (import ./themes/fallout.nix args)
]
