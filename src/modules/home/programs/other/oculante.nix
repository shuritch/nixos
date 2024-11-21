{ lib, pkgs, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.oculante.enable =
    lib.mkEnableOption "Enable oculante";

  config = lib.mkIf
    (cfg.desktop.enable && cfg.programs.oculante.enable == "oculante") {
      home.packages = with pkgs; [ oculante ];
      xdg.mimeApps.inverted.defaultApplications = {
        "oculante.desktop" = [
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
