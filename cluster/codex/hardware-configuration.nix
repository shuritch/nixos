{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [
        "nvme"
        "thunderbolt"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
    };

  };

  swapDevices = [ ];
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/3d2e5cb3-61b0-4d89-9f6a-9fa7956e6eee";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/5D29-0239";
      options = [ "fmask=0022" "dmask=0022" ];
      fsType = "vfat";
    };

    "/mnt/windows" = {
      device = "/dev/disk/by-uuid/A67E24F87E24C2C3";
      fsType = "ntfs-3g";
    };

    "/mnt/windows-storage" = {
      device = "/dev/disk/by-uuid/0050EE8E50EE89AC";
      fsType = "ntfs-3g";
    };
  };
}
