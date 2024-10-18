{ lib, ... }: {
  imports = [ ./cpufreq.nix ./undervolt.nix ./upower.nix ];
  options.my.hardware.battery.enable = lib.mkEnableOption "Enable battery api.";
}
