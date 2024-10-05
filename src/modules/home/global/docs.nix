{ lib, config, ... }: {
  config = lib.mkIf (!config.my.system.docs) {
    programs.man.enable = false;
    manual = lib.mapAttrs (_: lib.mkForce) {
      html.enable = false;
      json.enable = false;
      manpages.enable = false;
    };
  };
}
