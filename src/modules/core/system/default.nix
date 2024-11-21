{
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

  config.system = {
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
