{ lib, inputs, config, pkgs, ... }: {
  imports = [ inputs.nixos-wsl.nixosModules.wsl ];
  config = lib.mkIf (config.my.system.class == "wsl") {
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
