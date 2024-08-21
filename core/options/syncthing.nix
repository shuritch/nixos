{ lib, config, myEnv, ... }:

let
  inherit (config.services.syncthing.settings) devices;
  names = lib.mapAttrsToList (n: _: n) devices;
  sync = attrs: lib.mapAttrs (_: v: v // { devices = names; }) attrs;
  admin = myEnv.admin.login;
  home = "/home/${admin}";
  port = 8384;
  ignore = ''
    **/bin
    **/.turbo
    **/.changes
    **/.yarn
    **/.git
    **/.grit
    **/.changeset
    **/node_modules
    **/package.lock.json
    **/.husky
    **/dist
    **/coverage
    **/.next
    **/*.tsbuildinfo
    **/*.nyc_output
    **/*.tap
    **/.astro
    **/.direnv
    **/OS/result
    **.rar
    **.zip
    **.7zip
  '';
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
          "EKW632J-PBADOOQ-DMNGULQ-IBQW6CL-UXOYAUZ-MQDGWQL-PXSMJLF-CSAF3AC";
        hermes.id =
          "LDOSJMI-PYAMCGH-RF56NYE-X2IVTQE-DZIJKEY-7J57GTF-ULW7E67-HSROFQW";
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

  home-manager.users.${admin} = { ... }: {
    home.file = lib.mapAttrs'
      (k: v: lib.nameValuePair "${k}/.stignore" { text = ignore; })
      config.services.syncthing.settings.folders;
  };
}
