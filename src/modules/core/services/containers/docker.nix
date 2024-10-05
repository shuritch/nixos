{ pkgs, lib, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.docker.enable = lib.mkEnableOption "Enable docker.";
  config = lib.mkIf cfg.docker.enable {
    virtualisation = {
      containers.enable = true;
      oci-containers.backend = "podman";
      docker = {
        enable = true;
        autoPrune.enable = true;
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      dive # look into docker image layers
      docker-compose # start group of containers for dev
    ];
  };
}
