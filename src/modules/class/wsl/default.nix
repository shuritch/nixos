{ lib, inputs, config, pkgs, myClass, ... }:

lib.optionalAttrs (myClass == "wsl") {
  imports = [ inputs.nixos-wsl.nixosModules.wsl ];
  config = {
    wsl = {
      enable = true;
      defaultUser = config.my.system.admin;
      startMenuLaunchers = true;
      interop = {
        includePath = false;
        register = true;
      };
    };

    networking.tcpcrypt.enable = lib.mkForce false;
    services = { # disable useless features in WSL
      smartd.enable = lib.mkForce false;
      xserver.enable = lib.mkForce false;
    };

    environment = { # Open files in Windows
      variables.BROWSER = lib.mkForce "wsl-open";
      systemPackages = [ pkgs.wsl-open ];
    };
  };
}
