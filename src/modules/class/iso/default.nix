{ lib, pkgs, config, inputs, myClass, ... }:

let
  hostname = config.networking.hostName or "nixos";
  processor = pkgs.stdenv.hostPlatform.uname.processor;
  release = config.system.nixos.release;
  rev = inputs.self.shortRev or "dirty";
  name = "${hostname}-${release}-${rev}-${processor}";
in lib.optionalAttrs (myClass == "iso") {
  config = {
    systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];
    my.system.docs = lib.mkForce false;
    system.switch.enable = false;

    isoImage = {
      squashfsCompression = "zstd -Xcompression-level 19";
      isoName = lib.mkImageMediaOverride "${name}.iso";
      volumeID = lib.mkImageMediaOverride name;
      appendToMenuLabel = "";
      makeEfiBootable = true;
      makeUsbBootable = true;
      contents = [{
        source = lib.cleanSource inputs.self;
        target = "/flake";
      }];
    };

    boot = {
      swraid.enable = lib.mkForce false;
      loader.systemd-boot.enable = lib.mkForce false;
      loader.grub.enable = lib.mkForce false;
      kernelParams = lib.mkAfter [ "noquiet" "toram" ];
      supportedFilesystems = # https://github.com/NixOS/nixpkgs/issues/58959
        lib.mkForce [ "btrfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];
      initrd.systemd = { # NixOS/nixpkgs#291750
        enable = lib.mkImageMediaOverride false;
        emergencyAccess = lib.mkImageMediaOverride true;
      };
    };

    networking = {
      wireless.enable = lib.mkForce false;
      networkmanager = {
        enable = true;
        plugins = lib.mkForce [ ];
      };
    };

    environment = {
      stub-ld.enable = lib.mkForce false;
      defaultPackages = [ ];
      systemPackages = [
        (pkgs.writeScriptBin "myInstall"
          (builtins.readFile ../../../../install.sh))
        pkgs.gitMinimal
        pkgs.pciutils
        pkgs.vim
      ];
    };
  };
}
