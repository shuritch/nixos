{ lib, config, pkgs, ... }:

let cfg = config.my.boot;
in {
  options.my.boot = {
    loader = lib.mkOption {
      description = "The bootloader that should be used for the device.";
      type = lib.types.enum [ "none" "grub" "systemd-boot" ];
      default = "none";
    };

    systemdMemtest = lib.mkEnableOption "Enables Memtest86+";

    systemdTheme = lib.mkOption {
      type =
        lib.types.nullOr (lib.types.either lib.types.string lib.types.package);
      description = "Plymouth theme.";
      default = null;
    };

    grubDevice = lib.mkOption {
      type = lib.nullOr lib.str;
      default = "nodev";
      description = "The device to install the bootloader to.";
    };

    grubTheme = lib.mkOption {
      description = "Theme for GRUB menu.";
      type = lib.types.package;
      default = null;
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (cfg.loader == "none") {
      boot.loader = {
        grub.enable = lib.mkForce false;
        systemd-boot.enable = lib.mkForce false;
      };
    })

    (lib.mkIf (cfg.loader != "none") {
      boot.loader = {
        timeout = lib.mkForce 2; # held space to get the boot menu to appear
        generationsDir.copyKernels = true; # /nix/store not required for boot
        efi.canTouchEfiVariables = true; # allows to modify EFI variables
      };
    })

    (lib.mkIf (cfg.loader == "grub") {
      boot.loader.grub = {
        enable = lib.mkDefault true;
        enableCryptodisk = lib.mkDefault false;
        configurationLimit = 15;
        device = cfg.grubDevice;
        theme = cfg.grubTheme;
        useOSProber = true;
        efiSupport = true;
        extraConfig = let
          mainMonitor = lib.lists.findSingle (x: x.primary == true) null null
            config.my.hardware.monitors;
        in ''
          GRUB_GFXMODE="${toString mainMonitor.width}x${
            toString mainMonitor.height
          }"
        '';
      };
    })

    (lib.mkIf (cfg.loader == "systemd-boot") {
      boot.loader.systemd-boot = lib.mkMerge [
        {
          enable = lib.mkDefault true;
          configurationLimit = 15;
          consoleMode = lib.mkDefault "max"; # "max" / "keep"
          editor = false;
        }

        (lib.mkIf (cfg.systemdTheme != null) {
          boot.plymouth = lib.mkMerge [
            { enable = true; }
            (lib.mkIf (builtins.isString cfg.systemdTheme) {
              theme = cfg.systemdTheme;
            })
            (lib.mkIf (lib.isDerivation cfg.systemdTheme) {
              themePackages = [ cfg.systemdTheme ];
            })
          ];
          powerManagement = { # make plymouth work with sleep
            powerDownCommands = "${pkgs.plymouth} --show-splash";
            resumeCommands = "${pkgs.plymouth} --quit";
          };
        })

        (lib.mkIf cfg.systemdMemtest {
          boot.loader.systemd-boot = {
            extraFiles."efi/memtest86plus/memtest.efi" =
              "${pkgs.memtest86plus}/memtest.efi";
            extraEntries."memtest86plus.conf" = ''
              title MemTest86+
              efi   /efi/memtest86plus/memtest.efi
            '';
          };
        })
      ];
    })
  ];
}
