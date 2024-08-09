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

      devices = {
        atlas.id =
          "4HMQGUC-2F45JJN-JJV646T-M4QHMLI-XQUAND6-VXSNM43-OGKISXD-ANJHWQF";
        hermes.id =
          "SG5N6PX-YUDM5CE-LGAY6YG-I3XUO27-BDOGUFW-ALAM7AV-OTHVQ2V-ECQSIQC";
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
