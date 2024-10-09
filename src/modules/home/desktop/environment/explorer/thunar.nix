{ config, lib, pkgs, ... }:

let cfg = config.my.home.desktop;
in {
  config = lib.mkIf (cfg.enable && cfg.explorer == "thunar") {
    home.packages = with pkgs; [
      xfce.tumbler
      ffmpegthumbnailer
      (xfce.thunar.override {
        thunarPlugins = [
          xfce.thunar-volman
          xfce.thunar-archive-plugin
          xfce.thunar-media-tags-plugin
        ];
      })
    ];
  };
}
