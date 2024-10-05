{ pkgs, lib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.podman.enable = lib.mkEnableOption "Enable podman.";
  config = lib.mkIf cfg.podman.enable {
    virtualisation = {
      containers.enable = true;
      oci-containers.backend = "podman";
      podman = {
        enable = true;
        dockerCompat = true;
        dockerSocket.enable = true;
        defaultNetwork.settings.dns_enabled = true;
        autoPrune = {
          enable = true;
          flags = [ "--all" ];
          dates = "weekly";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      dive # look into docker image layers
      podman-tui # status of containers in the terminal
      podman-compose # start group of containers for dev
    ];
  };
}
