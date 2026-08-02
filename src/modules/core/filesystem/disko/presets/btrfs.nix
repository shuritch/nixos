{ lib, config, ... }:

let
  cfg = config.my.filesystem;
  root = config.fileSystems."/";
  wipeScript = ''
    mkdir /tmp -p
    MNTPOINT=$(mktemp -d)
    (
      mount -t btrfs -o subvol=/ ${root.device} "$MNTPOINT"
      trap 'umount "$MNTPOINT"' EXIT

      echo "Creating needed directories"
      mkdir -p "$MNTPOINT"/persist/var/{log,lib/{nixos,systemd}}
      if [ -e "$MNTPOINT/dont-wipe" ]; then
        echo "Skipping wipe"
      else
        echo "Cleaning root subvolume"
        btrfs subvolume delete -R "$MNTPOINT/root"
        echo "Restoring blank subvolume"
        btrfs subvolume snapshot "$MNTPOINT/root-blank" "$MNTPOINT/root"
      fi
    )
  '';

  phase1Systemd = config.boot.initrd.systemd.enable;
  toSystemdDevice = device:
    lib.concatStringsSep "-" (lib.tail
      (map (lib.replaceString "-" "\\x2d") (lib.splitString "/" device)))
    + ".device";
in {
  config = lib.mkIf (cfg.preset == "btrfs") {
    fileSystems."/persist".neededForBoot = true;

    boot.initrd = {
      supportedFilesystems = [ "btrfs" ];
      postDeviceCommands = lib.mkIf (!phase1Systemd) (lib.mkBefore wipeScript);
      systemd.services.restore-root = lib.mkIf phase1Systemd {
        description = "Rollback btrfs rootfs";
        wantedBy = [ "initrd.target" ];
        requires = [ (toSystemdDevice root.device) ];
        after = [ (toSystemdDevice root.device) ];
        before = [ "sysroot.mount" ];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = wipeScript;
      };
    };

    disko.devices.disk.main = {
      device = "/dev/nvme0n1";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "1M";
            type = "EF02";
          };

          esp = {
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          root = {
            size = "100%";
            content = {
              name = "root";
              type = "luks";
              settings.allowDiscards = true;
              content = {
                type = "btrfs";

                postCreateHook = ''
                  MNTPOINT=$(mktemp -d)
                  mount -t btrfs "$device" "$MNTPOINT"
                  trap 'umount $MNTPOINT; rm -d $MNTPOINT' EXIT
                  btrfs subvolume snapshot -r $MNTPOINT/root $MNTPOINT/root-blank
                '';

                subvolumes = {
                  "/root" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/";
                  };

                  "/nix" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/nix";
                  };

                  "/persist" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/persist";
                  };

                  "/swap" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/swap";
                    swap.swapfile = {
                      size = "8196M";
                      path = "swapfile";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
