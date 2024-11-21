{ lib, myLib, config, ... }: {
  my.network = {
    dnscrypt.enable = lib.mkDefault (myLib.isDesktop config);
    blocker.enable = lib.mkDefault (myLib.isDesktop config);
    fail2ban.enable = lib.mkDefault (myLib.isServer config);
    # tcpcrypt.enable = lib.mkDefault (myLib.isPC config);
    frkn.enable = lib.mkDefault (myLib.isDesktop config);
    optimizeTcp = lib.mkDefault (myLib.isDesktop config);
    randomMac = lib.mkDefault (myLib.isSuitablePC config);
    firewall = {
      allowPing = lib.mkDefault (myLib.isServer config);
      ui = lib.mkDefault (myLib.isPC config);
    };
  };
}
