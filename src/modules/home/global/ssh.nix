{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    compression = true;
    matchBlocks = {
      home-vpn = {
        host = "194.0.194.170";
        identitiesOnly = true;
        identityFile = "~/.ssh/id_ed25519";
        user = "shuritch";
        port = 49152;
      };

      uberi-ssh = {
        host = "78.140.220.18";
        identitiesOnly = true;
        identityFile = "~/.ssh/uberi/id_rsa";
        user = "wwwadm";
        port = 22;
      };
    };
  };
}
