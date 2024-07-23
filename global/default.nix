{ inputs, outputs, env-config, ... }:

{
  imports = [ ./modules ./hardware-configuration.nix ];
  system.stateVersion = env-config.originVersion;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false; # Changable ?
  services.printing.enable = true;
  documentation = {
    enable = true;
    dev.enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
    man.man-db.enable = true;
    man.generateCaches = true;
    nixos.enable = true;
  };
}
