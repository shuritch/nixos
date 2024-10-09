{ lib, myLib, config, ... }: {
  my.security = {
    wheelNeedsPassword = lib.mkDefault (myLib.isServer config);
    apparmor.enable = lib.mkDefault (!(myLib.isSubsystem config));
    polkit.enable = lib.mkDefault (!(myLib.isSubsystem config));
    auditd.enable = lib.mkDefault (!(myLib.isSubsystem config));
  };
}
