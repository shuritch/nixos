{ lib, config, ... }:

let cfg = config.system;
in {
  options.my.network = {
    # Doesn't require options
  };

  config = {
    services.openssh = {
      enable = true;
      startWhenNeeded = true;
      openFirewall = true;
      allowSFTP = true;
      ports = [ 22 ];
      banner = ''
        Connected to ${cfg.name} @ ${cfg.configurationRevision}
      '';

      settings = {
        PermitRootLogin = lib.mkDefault "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        AuthenticationMethods = "publickey";
        PubkeyAuthentication = "yes";
        ChallengeResponseAuthentication = "no";
        UsePAM = false;
        UseDns = false;
        X11Forwarding = false;

        GatewayPorts = "clientspecified"; # Allow forwarding ports to everywhere
        StreamLocalBindUnlink = "yes"; # Automatically remove stale sockets
        AcceptEnv = "WAYLAND_DISPLAY"; # Let WAYLAND_DISPLAY be forwarded

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
          "mlkem768x25519-sha256"
          "sntrup761x25519-sha512"
        ];

        Macs = [ # Use recommended Macs | `nixpkgs#ssh-audit`
          "hmac-sha2-512-etm@openssh.com"
          "hmac-sha2-256-etm@openssh.com"
          "umac-128-etm@openssh.com"
        ];
      };

      hostKeys = [
        {
          bits = 4096;
          path = "/etc/ssh/ssh_host_rsa_key";
          type = "rsa";
        }
        {
          bits = 4096;
          path = "/etc/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
      ];
    };
  };
}
