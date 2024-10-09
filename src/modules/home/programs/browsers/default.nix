{ config, lib, ... }:

let
  defaultBrowser = if config.programs.firefox.enable then
    "firefox-developer-edition"
  else if config.programs.chrome.enable then
    "chromium"
  else
    null;
in {
  imports = [ ./chrome.nix ./firefox.nix ];
  config = lib.mkIf (defaultBrowser != null) {
    home.sessionVariables.BROWSER = defaultBrowser;
    xdg.mimeApps.inverted.defaultApplications."${defaultBrowser}.desktop" = [
      "text/html"
      "text/xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/about"
      "x-scheme-handler/unknown"
      "x-scheme-handler/chrome"
      "application/x-extension-htm"
      "application/x-extension-html"
      "application/x-extension-shtml"
      "application/x-extension-xht"
      "application/x-extension-xhtml"
    ];
  };
}
