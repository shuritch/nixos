{ lib, ... }:

with lib; {
  isPC = cfg: any (d: d == cfg.my.system.class) [ "desktop" "laptop" ];
  isSubsystem = cfg: any (d: d == cfg.my.system.class) [ "iso" "wsl" ];
  isSuitablePC = cfg: any (d: d == cfg.my.system.class) [ "laptop" ];
  isHeadless = cfg: any (d: d == cfg.my.system.class) [ "server" "wsl" ];
  isDesktop = cfg: any (d: d == cfg.my.system.class) [ "desktop" ];
  isServer = cfg: any (d: d == cfg.my.system.class) [ "server" ];
  DEVICE_LIST = [ # This list will be use to preconfigure defaults
    "desktop" # High-end PC configuration
    "laptop" # Low-end PC configuration
    "server" # Very sercure configuration with only needed services
    "iso" # Configuration neeed for bootable usb devices
    "wsl" # Configuration for windows subsystem
    "minimal" # No configuration
  ];
}
