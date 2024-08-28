{ pkgs, config, ... }:

let
  inherit (config.colorscheme) colors;
  font = config.fontProfiles.regular;
in {
  home.packages = with pkgs; [ hunspell hunspellDicts.ru_RU libreoffice-qt ];
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      font = "${font.name} ${toString font.size}";
      recolor = true;
      default-bg = "${colors.surface}";
      default-fg = "${colors.surface_bright}";
      statusbar-bg = "${colors.surface_container}";
      statusbar-fg = "${colors.on_surface_variant}";
      inputbar-bg = "${colors.surface}";
      inputbar-fg = "${colors.on_secondary}";
      notification-bg = "${colors.surface}";
      notification-fg = "${colors.on_secondary}";
      notification-error-bg = "${colors.error}";
      notification-error-fg = "${colors.on_error}";
      notification-warning-bg = "${colors.error}";
      notification-warning-fg = "${colors.on_error}";
      highlight-color = "${colors.tertiary}";
      highlight-active-color = "${colors.secondary}";
      completion-bg = "${colors.surface_bright}";
      completion-fg = "${colors.on_surface}";
      completions-highlight-bg = "${colors.secondary}";
      completions-highlight-fg = "${colors.on_secondary}";
      recolor-lightcolor = "${colors.surface}";
      recolor-darkcolor = "${colors.inverse_surface}";
    };
  };

  xdg.mimeApps.inverted.defaultApplications = {
    "org.pwmt.zathura.desktop" = [ "application/pdf" ];
    "libreoffice-base.desktop" = [
      "application/vnd.oasis.opendocument.database"
      "application/vnd.sun.xml.base"
    ];

    "libreoffice-calc.desktop" = [
      "application/vnd.ms-excel"
      "application/vnd.oasis.opendocument.spreadsheet"
      "application/vnd.oasis.opendocument.spreadsheet-template"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.template"
      "application/vnd.stardivision.calc"
      "application/vnd.sun.xml.calc"
      "application/vnd.sun.xml.calc.template"
      "text/csv"
    ];

    "libreoffice-draw.desktop" = [
      "applxdg.mime.defaultApplicationsication/vnd.oasis.opendocument.graphics"
      "application/vnd.oasis.opendocument.graphics-template"
      "application/vnd.stardivision.draw"
      "application/vnd.sun.xml.draw"
      "application/vnd.sun.xml.draw.template"
    ];

    "libreoffice-impress.desktop" = [
      "application/vnd.ms-powerpoint"
      "application/vnd.oasis.opendocument.presentation"
      "application/vnd.oasis.opendocument.presentation-template"
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      "application/vnd.openxmlformats-officedocument.presentationml.template"
      "application/vnd.stardivision.impress"
      "application/vnd.sun.xml.impress"
      "application/vnd.sun.xml.impress.template"
    ];

    "libreoffice-math.desktop" = [
      "application/vnd.oasis.opendocument.formula"
      "application/vnd.stardivision.math"
      "application/vnd.sun.xml.math"
    ];

    "libreoffice-writer.desktop" = [
      "application/vnd.ms-word"
      "application/vnd.oasis.opendocument.text"
      "application/vnd.oasis.opendocument.text-master"
      "application/vnd.oasis.opendocument.text-template"
      "application/vnd.oasis.opendocument.text-web"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.template"
      "application/vnd.stardivision.writer"
      "application/vnd.sun.xml.writer"
      "application/vnd.sun.xml.writer.global"
      "application/vnd.sun.xml.writer.template"
      "application/vnd.wordperfect"
    ];
  };
}
