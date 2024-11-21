{ lib, config, myLib, ... }: {
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    openFirewall = true;
    allowSFTP = false;
    ports = [ 22 ];
    hostKeys = [{
      path = "/etc/ssh/ssh_host_ed25519_key";
      type = "ed25519";
    }];

    settings = {
      PermitRootLogin = lib.mkDefault "no"; # Don't allow root login
      PasswordAuthentication = false; # Allow key based logins and not password
      StreamLocalBindUnlink = "yes"; # Automatically remove stale sockets
      GatewayPorts = "clientspecified"; # Allow forwarding ports to everywhere
      AcceptEnv = "WAYLAND_DISPLAY"; # Let WAYLAND_DISPLAY be forwarded
      KbdInteractiveAuthentication = false;
      ChallengeResponseAuthentication = "no";
      AuthenticationMethods = "publickey";
      X11Forwarding = myLib.isPC config;
      PubkeyAuthentication = "yes";
      UseDns = false;
      UsePAM = true;

      # kick out inactive sessions
      ClientAliveCountMax = 5;
      ClientAliveInterval = 60;

      KexAlgorithms = [ # Use recommended algorithms | `nixpkgs#ssh-audit`
        "curve25519-sha256"
        "curve25519-sha256@libssh.org"
        "diffie-hellman-group16-sha512"
        "diffie-hellman-group18-sha512"
        "sntrup761x25519-sha512@openssh.com"
        "diffie-hellman-group-exchange-sha256"
      ];

      Macs = [ # Use recommended Macs | `nixpkgs#ssh-audit`
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
        "umac-128-etm@openssh.com"
      ];
    };
  };
}
