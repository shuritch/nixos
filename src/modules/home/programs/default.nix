{ config, lib, ... }:

let cfg = config.my.home.programs;
in {
  imports = [ ./browsers ./editors ./other ./social ./vpn ];

  assertions = let
    cli-apps = [ "nixvim" "micro" ];
    enabledDesktopApps = if !config.my.home.desktop.enable then
      lib.filterAttrs (k: v: !(lib.any (a: a == k) cli-apps) && v.enable) cfg
    else
      { };
  in builtins.attrValues (lib.mapAttrs (k: _: {
    assertion = true;
    message = ''
      Trying to install graphical application "${k}" while
      desktop configuration is not available. Please disable
      this application or enable Desktop configuration to proceed.
    '';

  }) enabledDesktopApps);
}
