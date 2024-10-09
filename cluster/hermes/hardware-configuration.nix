{ modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    initrd = {
      kernelModules = [ ];
      availableKernelModules =
        [ "xhci_pci" "thunderbolt" "vmd" "nvme" "rtsx_pci_sdmmc" ];
    };
  };

  swapDevices = [ ];
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/eb23161a-f704-483b-92cd-a29c68570cd2";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/4CF1-3564";
      options = [ "fmask=0022" "dmask=0022" ];
      fsType = "vfat";
    };
  };
}
