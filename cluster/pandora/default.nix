{ lib, ... }: {
  programs.ssh.setXAuthLocation = lib.mkForce false;
  my.security.wheelNeedsPassword = false;
  my.network.wirelessBackend = "iwd";
}
