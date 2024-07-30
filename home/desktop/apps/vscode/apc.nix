{
  "animations.Install-Method" = "Apc Customize UI++";

  "apc.listRow" = {
    lists = [ "explorer-folders-view" "quick-input-list" "results" ];
    height = 30;
  };

  "apc.electron" = {
    titleBarStyle = "hidden";
    trafficLightPosition = {
      x = 70;
      y = 70000;
    };
  };

  "apc.stylesheet" = {
    ".title-actions" = "display: none !important";
    ".quick-input-widget.show-file-icons, .editor-widget.find-widget" =
      "box-shadow: none !important";
    ".filematch .monaco-icon-label:before, .custom-list-row.results .monaco-list-row .monaco-icon-label:before" =
      "background-position: 0 bottom !important";
    ".filematch .monaco-count-badge" = "padding: 5px 6px 0 6px !important";
    ".sidebar .title-label" = "padding: 0 !important";
    ".monaco-workbench .monaco-list:not(.element-focused):focus:before" =
      "outline: none !important";
    ".sidebar" = "border: none !important";
    ".monaco-editor .cursors-layer .cursor" =
      "background-image: linear-gradient(135deg, #67D0FF 10%, #C45DFF 100%)";
    ".quick-input-list-row div" =
      "display: flex !important; align-items: center !important";
    ".panel .composite.title" = "visibility: hidden !important";
    ".title.show-file-icons .label-container .monaco-icon-label.file-icon" =
      "padding-bottom: 6px !important";
    ".sidebar .title-label h2" = "line-height: 2.8 !important";
    ".monaco-editor .scroll-decoration" = "display: none !important";
    ".monaco-scrollable-element > .shadow.top" = "display: none !important";
  };
}
