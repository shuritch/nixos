{ config, lib, modulesPath, myEnv, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault myEnv.platform;
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot = {
    extraModulePackages = [ ];
    kernelModules = [ "kvm-intel" ];
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "vmd"
        "nvme"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/eb23161a-f704-483b-92cd-a29c68570cd2";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/4CF1-3564";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };
}
