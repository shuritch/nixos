{ lib, myEnv, config, ... }:

with builtins;
let
  publicKey = host: ../../hosts/${host}/host_ed25519.pub;
  knownHosts = (filter (host: pathExists (publicKey host)) myEnv.hosts);
in {
  services.openssh = {
    enable = true;
    hostKeys = [{
      path = "/etc/ssh/ssh_host_ed25519_key";
      type = "ed25519";
    }];

    settings = {
      PermitRootLogin = lib.mkDefault "no";
      PasswordAuthentication = false; # Harden
      StreamLocalBindUnlink = "yes"; # Automatically remove stale sockets
      GatewayPorts = "clientspecified"; # Allow forwarding ports to everywhere
      AcceptEnv = "WAYLAND_DISPLAY"; # Let WAYLAND_DISPLAY be forwarded
      X11Forwarding = true;
    };
  };

  programs.ssh.knownHosts = lib.genAttrs knownHosts (host: {
    publicKeyFile = publicKey host;
    extraHostNames = [ host ] # 👇 Alias for localhost if it's the same host
      ++ (lib.optional (host == config.networking.hostName) "localhost");
  });

  # Passwordless sudo when SSH'ing with keys
  security.pam.sshAgentAuth = {
    enable = true;
    authorizedKeysFiles = [ "/etc/ssh/authorized_keys.d/%u" ];
  };
}
