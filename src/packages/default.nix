{ lib, ... }@args:

lib.foldl (a: b: a // b) { } [
  (import ./grub-themes args)
  (import ./plymouth-themes args)
  (import ./gyro-hyprland args)
  (import ./shellcolord args)
  (import ./wallpapers args)
]
