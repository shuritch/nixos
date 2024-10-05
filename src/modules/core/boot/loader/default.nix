{ lib, ... }: {
  imports = [ ./grub.nix ./none.nix ./systemd-boot.nix ];
  options.my.boot.loader = lib.mkOption {
    description = "The bootloader that should be used for the device.";
    type = lib.types.enum [ "none" "grub" "systemd-boot" ];
    default = "none";
  };

  options.my.boot.configurationLimit = lib.mkOption {
    description = "Maximum number of configuration entries.";
    type = lib.types.number;
    default = 25;
  };
}
