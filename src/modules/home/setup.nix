username:
{ osConfig, myLib, ... }: {
  imports = [ ./programs ./services ./desktop ./cli ./global ];

  options.my = {
    boot = myLib.mkStubOption "Boot related configuration";
    hardware = myLib.mkStubOption "Hardware related configuration";
    network = myLib.mkStubOption "Network related configuration";
    programs = myLib.mkStubOption "Programs related configuration";
    security = myLib.mkStubOption "Security related configuration";
    services = myLib.mkStubOption "Services related configuration";
    system = myLib.mkStubOption "System related configuration";
  };

  config = {
    systemd.user.startServices = "sd-switch";
    programs.home-manager.enable = true;
    programs.git.enable = true;

    my = {
      inherit (osConfig.my.system.users.${username}) home;
      inherit (osConfig.my) hardware services network boot;
      inherit (osConfig.my) programs security system;
    };

    home = {
      inherit username;
      homeDirectory = "/home/${username}";
      stateVersion = osConfig.system.stateVersion;
      sessionPath = [ "$HOME/.local/bin" ];
      sessionVariables = { FLAKE = osConfig.my.system.flakePath; };
    };
  };
}
