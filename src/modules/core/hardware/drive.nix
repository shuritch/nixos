{ lib, config, ... }: {
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  services.btrfs.autoScrub =
    lib.mkIf (builtins.hasAttr "btrfs" config.boot.supportedFilesystems) {
      enable = true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };
}
