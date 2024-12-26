{ lib, ... }: {
  services.openssh.settings.PermitRootLogin = "yes";
  programs.ssh.setXAuthLocation = lib.mkForce false;
  my.security.wheelNeedsPassword = false;
  my.network.wirelessBackend = "iwd";
}
