{ lib, config, pkgs, ... }:

let cfg = config.my.services;
in {
  options.my.services.printing = {
    enable = lib.mkEnableOption "Enable printing.";
    extraDrivers = lib.mkOption {
      description = "A list of additional drivers to install for printing";
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.printing.enable {
    services = {
      printing = {
        enable = true;
        drivers = with pkgs; [ gutenprint hplip ] ++ cfg.printing.extraDrivers;
      };

      avahi = { # network
        enable = true; # discovery
        nssmdns4 = true; # of
        openFirewall = true; # printers
      };
    };
  };
}
