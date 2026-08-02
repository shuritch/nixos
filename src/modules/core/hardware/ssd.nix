{ lib, config, ... }:

let cfg = config.boot.supportedFilesystems;
in {
  options.my.hardware = {
    # Doesn't require options
  };

  config = {
    # discard blocks that are not in use by the filesystem, good for SSDs health
    services.fstrim = {
      enable = true;
      interval = "weekly";
    };

    # clean btrfs devices
    services.btrfs.autoScrub = lib.mkIf (builtins.hasAttr "btrfs" cfg) {
      enable = true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };
  };
}
