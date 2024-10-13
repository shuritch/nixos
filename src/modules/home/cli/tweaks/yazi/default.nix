{ config, lib, pkgs, ... }:

let cfg = config.my.home.cli;
in {
  imports = [ ./theme ];
  config = lib.mkIf cfg.enableTweaks {
    home.packages = with pkgs; [ exiftool mediainfo mpv ];
    programs.yazi = {
      enable = true;
      settings = {
        manager = {
          show_hidden = true;
          sort_dir_first = true;
          layout = [ 1 4 3 ];
          sort_by = "alphabetical";
          sort_sensitive = true;
          sort_reverse = false;
          linemode = "none";
          show_symlink = true;
        };

        preview = {
          image_filter = "lanczos3";
          image_quality = 50; # 50-90, lower is faster but less accurate
          sixel_fraction = 20; # 10-20, higher is faster but less accurate
          tab_size = 2;
          max_width = 600;
          max_height = 900;
          cache_dir = "${config.xdg.cacheHome}/yazi";
        };
      };
    };
  };
}
