{ modulesPath, lib, myEnv, ... }:

let relative = lib.path.append ../../core/options;
in {
  networking.hostName = "iso";
  system.stateVersion = myEnv.origin;
  nixpkgs.hostPlatform = lib.mkDefault myEnv.platform;
  nix.settings.auto-optimise-store = false; # Speedup write
  boot.binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];

  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal-new-kernel.nix"
    ../../core/default.nix
    (relative "netmanager.nix")
  ];

  nixpkgs.config.permittedInsecurePackages =
    [ "python-2.7.18.8" "electron-25.9.0" "electron-24.8.6" ];

  networking.wireless.enable = false;
  networking.wireless.iwd.enable = true;
  boot.supportedFilesystems =
    lib.mkForce [ "btrfs" "vfat" "f2fs" "xfs" "ntfs" ];
}
