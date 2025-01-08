{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    compression = true;
    matchBlocks = {
      home-vpn = {
        identityFile = "~/.ssh/id_ed25519";
        hostname = "194.0.194.170";
        identitiesOnly = true;
        user = "shuritch";
        port = 49152;
      };

      uberi-vps = {
        identityFile = "~/.ssh/uberi/id_rsa";
        hostname = "78.140.220.18";
        identitiesOnly = true;
        user = "wwwadm";
        port = 22;
      };
    };
  };
}
