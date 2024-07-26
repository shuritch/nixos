{ config, inputs, outputs, ... }: {
  imports = [ ./bundle.nix ] ++ (builtins.attrValues outputs.nixosModules);
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  home-manager.useGlobalPkgs = true;

  system.stateVersion = config.originVersion;
  system.autoUpgrade.allowReboot = false; # Changable ?
  system.autoUpgrade.enable = true;
  # services.printing.enable = true;
  # hardware.enableRedistributableFirmware = true;

  # Fix for qt6 plugins
  environment.profileRelativeSessionVariables = {
    QT_PLUGIN_PATH = [ "/lib/qt-6/plugins" ];
  };

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
