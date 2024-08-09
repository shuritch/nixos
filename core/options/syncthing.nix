{ lib, config, myEnv, ... }:

let
  inherit (config.services.syncthing.settings) devices;
  names = lib.mapAttrsToList (n: _: n) devices;
  sync = attrs: lib.mapAttrs (_: v: v // { devices = names; }) attrs;
  admin = myEnv.admin.login;
  home = "/home/${admin}";
  port = 8384;
in {
  networking.firewall.allowedTCPPorts = [ port 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  services.syncthing = {
    enable = true;
    user = admin;
    dataDir = "${home}/.syncthing";
    guiAddress = "127.0.0.1:${builtins.toString port}";
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      gui = {
        user = "admin";
        password = "admin";
      };

      folders = sync {
        "Documents" = { path = "${home}/Documents"; };
        "Music" = { path = "${home}/Music"; };
        "Desktop" = { path = "${home}/Desktop"; };
        "Videos" = { path = "${home}/Videos"; };
        "Pictures" = { path = "${home}/Pictures"; };
      };
    };
  };
}
