{ env-config, lib, ... }: {
  networking = {
    hostName = env-config.hostname;
    networkmanager.enable = true;
    useDHCP = true;
  };

  programs.ssh.enable = true;
  services.tailscale.enable = true;
  services.openssh = {
    enable = lib.mkForce true;
    ports = [ 2222 ];
    settings = { X11Forwarding = true; };
  };
}
