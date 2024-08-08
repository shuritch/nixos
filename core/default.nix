{ inputs, outputs, myEnv, ... }: {
  imports = [ ./bundle.nix ] ++ (builtins.attrValues outputs.nixosModules);
  home-manager.extraSpecialArgs = { inherit inputs outputs myEnv; };
  home-manager.useGlobalPkgs = true;
  system.stateVersion = myEnv.origin;
  services.printing.enable = true;
  services.upower.enable = true;
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

  # Fix for qt6 plugins
  environment.profileRelativeSessionVariables = {
    QT_PLUGIN_PATH = [ "/lib/qt-6/plugins" ];
  };
}
