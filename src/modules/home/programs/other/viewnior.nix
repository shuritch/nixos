{ lib, pkgs, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.viewnior.enable =
    lib.mkEnableOption "Enable viewnior";

  config = lib.mkIf
    (cfg.desktop.enable && cfg.programs.viewnior.enable == "viewnior") {
      home.packages = with pkgs; [ viewnior ];
      xdg.mimeApps.inverted.defaultApplications = {
        "viewnior.desktop" = [
          "image/bmp"
          "image/gif"
          "image/jpeg"
          "image/jpg"
          "image/pjpeg"
          "image/png"
          "image/tiff"
          "image/x-bmp"
          "image/x-gray"
          "image/x-icb"
          "image/x-ico"
          "image/x-png"
          "image/x-portable-anymap"
          "image/x-portable-bitmap"
          "image/x-portable-graymap"
          "image/x-portable-pixmap"
          "image/x-xbitmap"
          "image/x-xpixmap"
          "image/x-pcx"
          "image/svg+xml"
          "image/svg+xml-compressed"
          "image/vnd.wap.wbmp;image/x-icns"
        ];
      };
    };
}
