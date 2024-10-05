{ lib, ... }@args:

lib.foldl (a: b: a // b) { } [
  (import ./themes/dedsec.nix args)
  (import ./themes/distro.nix args)
  (import ./themes/fallout.nix args)
]
