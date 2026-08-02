{ lib, config, pkgs, ... }:

let cfg = config.my.boot;
in {
  options.my.boot = {
    kernelTweaks = lib.mkEnableOption "Kernel parameters";

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
  };

  config.boot = let
    inherit (lib) flip elemAt pipe splitString;
    getArch = flip pipe [ (splitString "-") (flip elemAt 0) ];
  in {
    consoleLogLevel = 3;
    kernelPackages = lib.mkOverride 500 cfg.kernel;
    kernel.sysctl."vm.max_map_count" = 2147483642; # # increase the map count
    swraid.enable = lib.mkDefault false; # support for Linux MD RAID arrays
    binfmt = lib.mkIf ((builtins.length cfg.emulatedSystems) != 0) {
      emulatedSystems = cfg.emulatedSystems;
      registrations = lib.genAttrs cfg.emulatedSystems (system: {
        interpreter = "${pkgs.qemu}/bin/qemu-${getArch system}"; # qemu binds
      });
    };

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
    ]);
  };
}
