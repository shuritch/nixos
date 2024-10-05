{ lib, pkgs, config, ... }:

let cfg = config.my.boot;
in {
  imports = [ ./loader ./plymouth.nix ];
  options.my.boot = {
    kernelTweaks = lib.mkEnableOption "Kernel parameters";
    tmpOnTmpfs = lib.mkEnableOption "`/tmp` living on tmpfs.";

    kernel = lib.mkOption {
      description = "The kernel to use for the system.";
      default = pkgs.linuxPackages_latest;
      type = lib.types.raw;
    };

    emulatedSystems = lib.mkOption {
      description = "List of systems to emulate.";
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };

    initrd = {
      enableTweaks = lib.mkEnableOption "Quality of life tweaks.";
      optimizeCompressor = lib.mkEnableOption "Initrd better compression.";
    };

    silentBoot = lib.mkEnableOption "Enables `quiet` kernel parameter." // {
      default = cfg.plymouth.enable;
    };
  };

  config.boot = {
    consoleLogLevel = 3;
    kernelPackages = lib.mkOverride 500 cfg.kernel;
    kernel.sysctl."vm.max_map_count" = 2147483642; # # increase the map count
    swraid.enable = lib.mkDefault false; # support for Linux MD RAID arrays
    binfmt = lib.mkIf ((builtins.length cfg.emulatedSystems) != 0) {
      emulatedSystems = cfg.emulatedSystems;
      registrations = {
        aarch64-linux.interpreter = "${pkgs.qemu}/bin/qemu-aarch64";
        i686-linux.interpreter = "${pkgs.qemu}/bin/qemu-i686";
      };
    };

    loader = {
      timeout = lib.mkForce 2; # 0 => held space to get the boot menu to appear
      generationsDir.copyKernels = true; # /nix/store not required for boot
      efi.canTouchEfiVariables = true; # allows to modify EFI variables
    };

    tmp = {
      useTmpfs = cfg.tmpOnTmpfs; # If not using tmpf 👇, we must clean
      cleanOnBoot = lib.mkDefault (!config.boot.tmp.useTmpfs);
      # tmpfsSize = mkDefault "75%";
    };

    initrd = lib.mkMerge [
      (lib.mkIf cfg.initrd.enableTweaks {
        verbose = false; # removes only the mandatory messages by NixOS
        systemd.enable = true; # enable systemd in initrd (experimental)
        systemd.strip = true; # strip copied binaries and libraries from inframs
      })

      (lib.mkIf cfg.initrd.optimizeCompressor {
        compressorArgs = [ "-19" "-T0" ];
        compressor = "zstd";
      })
    ];

    # https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
    # https://en.wikipedia.org/wiki/Kernel_page-table_isolation
    kernelParams = (lib.optionals cfg.kernelTweaks [
      "vt.global_cursor_default=0" # disable the cursor in vt to get a black screen during intermissions
      "pti=auto" # https://en.wikipedia.org/wiki/Kernel_page-table_isolation
      "idle=nomwait" # intel_idle -> acpi_idle
      "iommu=pt" # enable IOMMU for devices used in passthrough
      "usbcore.autosuspend=-1" # disable usb autosuspend
      "noresume" # isables resume and restores original swap space
      "acpi_backlight=native" # allow systemd to set and save the backlight state
      "fbcon=nodefer" # prevent the kernel from blanking plymouth out of the fb
      "logo.nologo" # disable boot logo
    ]) ++ (lib.optionals cfg.silentBoot [
      "quite" # tell the kernel to not be verbose
      "loglevel=3" # kernel log message level
      "udev.log_level=3" # udev log message level
      "rd.udev.log_level=3" # lower the udev log level
      "systemd.show_status=auto" # disable systemd status messages
      "rd.systemd.show_status=auto" # systemd-udev will be used instead of initrd
    ]);
  };
}
