{ config, lib, ... }:

let cfg = config.my.hardware;
in {
  imports = [
    ./battery
    ./cpu
    ./gpu
    ./audio.nix
    ./bluetooth.nix
    ./drive.nix
    ./input.nix
    ./lid.nix
    ./monitors.nix
    ./ram.nix
    ./video.nix
  ];

  options.my.hardware = {
    webcam = lib.mkEnableOption "Enable webcam kernel support.";
    thunderbolt = lib.mkEnableOption "Enable thunderbolt support." // {
      default = true;
    };
  };

  config = {
    hardware.enableRedistributableFirmware = true;
    boot.blacklistedKernelModules = lib.concatLists [
      (lib.optionals (!cfg.webcam) [ "uvcvideo" ])
      (lib.optionals (!cfg.bluetooth) [ "bluetooth" "btusb" ])
      (lib.optionals (!cfg.thunderbolt) [
        "thunderbolt" # DMA attacks prevention
        "firewire-core"
      ])
    ];
  };
}
