{ config, lib, pkgs, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware.lid = lib.mkEnableOption "Enable lid support.";
  config = lib.mkIf cfg.lid {
    environment.systemPackages = with pkgs; [ acpi powertop brightnessctl ];
    hardware.acpilight.enable = lib.mkDefault false; # Prefer brightnessctl
    programs.light.enable = true;
    services.acpid.enable = true;
    boot = {
      kernelModules = [ "acpi_call" ];
      extraModulePackages = with config.boot.kernelPackages; [
        acpi_call
        cpupower
      ];
    };
  };
}
