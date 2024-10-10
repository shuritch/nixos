{ lib, ... }@args:

lib.foldl (a: b: a // b) { } [
  (import ./grub-themes args)
  (import ./plymouth-themes args)
  (import ./shellcolord args)
  (import ./wallpapers args)
]
