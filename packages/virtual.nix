{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.podman = {
    enable = true;
    # dockerCompat = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}