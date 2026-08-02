{ lib, ... }:

let
in {
  imports = [
    # keep-sorted start
    ./cpufreq.nix
    ./undervolt.nix
    ./upower.nix
    # keep-sorted end
  ];

  options.my.hardware = {
    battery.enable = lib.mkEnableOption "Enable battery api.";
  };
}
