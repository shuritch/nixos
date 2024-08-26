{ lib, ... }: {
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = lib.mkDefault "no";
      PasswordAuthentication = false; # Harden
      StreamLocalBindUnlink = "yes"; # Automatically remove stale sockets
      GatewayPorts = "clientspecified"; # Allow forwarding ports to everywhere
      AcceptEnv = "WAYLAND_DISPLAY"; # Let WAYLAND_DISPLAY be forwarded
      X11Forwarding = true;
    };

    hostKeys = [{
      path = "/etc/ssh/ssh_host_ed25519_key";
      type = "ed25519";
    }];
  };

  # Passwordless sudo when SSH'ing with keys
  security.pam.sshAgentAuth = {
    enable = true;
    authorizedKeysFiles = [ "/etc/ssh/authorized_keys.d/%u" ];
  };
}
