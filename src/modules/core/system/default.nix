{ lib, myLib, config, ... }:

let cfg = config.my.system;
in {
  imports = [
    ./activation.nix
    ./cache.nix
    ./console.nix
    ./documentation.nix
    ./environment.nix
    ./locale.nix
    ./nix.nix
    ./nixpkgs.nix
  ];

  options.my.system = {
    stateVersion = lib.mkOption {
      description = "NixOs Release born with.";
      default = "23.05"; # From flake
      type = lib.types.str;
    };

    class = lib.mkOption {
      default = null;
      description = "Class of device";
      type = lib.types.enum myLib.DEVICE_LIST;
    };
  };

  config.system = {
    stateVersion = cfg.stateVersion;
    disableInstallerTools = false;
    # disableInstallerTools = config.programs.nh.enable;
    configurationRevision = null; # OS Revision
    autoUpgrade.enable = false; # Disable random reboots
    autoUpgrade.allowReboot = false; # Disable random reboots
    switch = {
      enable = false; # disable the old implementation
      enableNg = true; # enable the new implementation
    };
  };
}
