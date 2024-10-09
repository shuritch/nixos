{ lib, config, ... }:

let cfg = config.my.security;
in {
  options.my.security.tor.enable = lib.mkEnableOption "Enable TOR";
  config.services.tor = lib.mkIf cfg.tor.enable {
    enable = true;
    client.enable = true;
    client.dns.enable = true;
    torsocks.enable = true;
  };
}
