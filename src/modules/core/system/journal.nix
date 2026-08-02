{ lib, config, ... }:

let
in {
  options.my.system = {
    # Doesn't require options
  };

  config.services = {
    journald.extraConfig = lib.mkIf (config.my.system.class != "server") ''
      SystemMaxUse=100M
      RuntimeMaxUse=50M
      SystemMaxFileSize=50M
    '';
  };
}
