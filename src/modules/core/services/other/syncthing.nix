{ lib, config, ... }:

let
  admin = config.my.system.admin;
  cfg = config.my.services;
in {
  options.my.services.syncthing = {
    enable = lib.mkEnableOption "Enable syncthing.";

    devices = lib.mkOption {
      description = "Syncthing devices.";
      type = lib.types.attrsOf lib.types.anything;
      default = { };
    };

    folders = lib.mkOption {
      description = "Syncthing folders.";
      type = lib.types.attrsOf lib.types.anything;
      default = { };
    };
  };

  config = lib.mkIf cfg.syncthing.enable {
    networking.firewall = {
      allowedTCPPorts = [ 8384 22000 ];
      allowedUDPPorts = [ 22000 21027 ];
    };

    services.syncthing = {
      enable = true;
      user = admin;
      dataDir = "/home/${admin}/.syncthing";
      guiAddress = "127.0.0.1:8384";
      openDefaultPorts = true;
      overrideDevices = true;
      overrideFolders = true;
      settings = {
        devices = cfg.syncthing.devices;
        folders = cfg.syncthing.folders;
        gui.user = "admin";
        gui.password = "admin";
      };
    };

    home-manager.users.${admin} = let
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
        **/OS
        **.rar
        **.zip
        **.7zip
      '';
    in {
      home.file = lib.mapAttrs'
        (k: v: lib.nameValuePair "${k}/.stignore" { text = ignore; })
        config.services.syncthing.settings.folders;
    };
  };
}
