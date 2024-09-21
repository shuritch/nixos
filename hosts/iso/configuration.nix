{ modulesPath, lib, myLib, pkgs, ... }: {
  imports = myLib.pfxPaths ../../core/options [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal-new-kernel.nix"
    "netmanager.nix"
  ];

  fonts.fontconfig.enable = lib.mkForce false;
  networking.wireless.enable = lib.mkForce false;
  nix.settings.auto-optimise-store = false; # Speedup write
  isoImage.squashfsCompression = "zstd -Xcompression-level 10";
  programs.command-not-found.enable = false;

  boot = {
    enableContainers = false;
    swraid.enable = lib.mkForce false;
    kernelParams = lib.mkAfter [ "noquiet" "toram" ];
    loader.systemd-boot.enable = lib.mkForce false;
    supportedFilesystems =
      lib.mkForce [ "btrfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];
    initrd.systemd = {
      enable = lib.mkImageMediaOverride false;
      emergencyAccess = lib.mkImageMediaOverride true;
    };
  };

  xdg = {
    autostart.enable = false;
    icons.enable = false;
    mime.enable = false;
    sounds.enable = false;
  };

  environment.systemPackages =
    [ (pkgs.writeScriptBin "sysinstall" (builtins.readFile ../../install.sh)) ];
}
