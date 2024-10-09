{ lib, config, ... }:

let cfg = config.my.system;
in {
  options.my.system.docs = lib.mkEnableOption "Enable documentation pages.";
  config.documentation = lib.mapAttrs (_: lib.mkForce) {
    enable = cfg.docs;
    dev.enable = cfg.docs;
    doc.enable = cfg.docs;
    info.enable = cfg.docs;
    nixos.enable = cfg.docs;
    man = {
      enable = cfg.docs;
      generateCaches = cfg.docs;
      man-db.enable = cfg.docs;
      mandoc.enable = cfg.docs;
    };
  };
}
