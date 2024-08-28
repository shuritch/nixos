{ outputs, lib, myEnv, myLib, ... }:

let
  global = myLib.dotNixFromDirRecursive ./.;
  main = ../hosts/${myEnv.host}/configuration.nix;
  hardware = ../hosts/${myEnv.host}/hardware-configuration.nix;
  hardwareExists = lib.pathExists hardware;
in {
  imports = [ ./users/admin.nix main ] ++ global
    ++ (lib.optionals hardwareExists [ hardware ])
    ++ (builtins.attrValues outputs.nixosModules);

  networking.useDHCP = lib.mkDefault true;
  networking.hostName = lib.mkDefault myEnv.host;
  system.stateVersion = lib.mkDefault myEnv.origin;
  nixpkgs.hostPlatform = lib.mkDefault myEnv.platform;
  services.fstrim.enable = true;
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

  nixpkgs.config.permittedInsecurePackages = myEnv.permitedInsecurePackages;
  hardware.enableRedistributableFirmware = true;
  environment.profileRelativeSessionVariables = {
    QT_PLUGIN_PATH = [ "/lib/qt-6/plugins" ];
  };
}
