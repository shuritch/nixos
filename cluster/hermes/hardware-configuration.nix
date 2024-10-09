{ modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ ];
    extraModulePackages = [ ];
    initrd = {
      kernelModules = [ ];
      availableKernelModules =
        [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    };
  };

  swapDevices = [ ];
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/1c5f93d0-b78c-4bd9-bf54-c869ba5e0e7a";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/CEEC-5381";
      fsType = "vfat";
    };

    "/mnt/windows" = {
      device = "/dev/disk/by-uuid/8CC2B90BC2B8FB12";
      options = [ "rw" "uid=1000" ];
      fsType = "ntfs-3g";
    };

    "/mnt/windows-extra" = {
      device = "/dev/disk/by-uuid/0CD85DE0D85DC91A";
      options = [ "rw" "uid=1000" ];
      fsType = "ntfs-3g";
    };
  };
}
