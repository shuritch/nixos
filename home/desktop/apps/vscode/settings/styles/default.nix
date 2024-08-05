config:

let mono-font = config.fontProfiles.monospace.family;
in {
  "apc.imports" = [ builtins.toString ./style.css ];
  "apc.electron" = { "frame" = false; };
  "apc.parts.font.family" = {
    "sidebar" = mono-font;
    "titlebar" = mono-font;
    "activityBar" = mono-font;
    "panel" = mono-font;
    "tabs" = mono-font;
    "statusbar" = mono-font;
    "settings-body" = mono-font;
    "extension-editor" = mono-font;
    "monaco-menu" = mono-font;
  };

  "apc.header" = {
    "height" = 35;
    "fontSize" = 15;
  };

  "apc.sidebar.titlebar" = {
    "height" = 35;
    "fontSize" = 13;
  };

  "apc.listRow" = {
    "height" = 30;
    "fontSize" = 14;
  };

  "apc.stylesheet" = {
    ".title-label > h2" = "display: none"; # Remove primary side bar title
    ".title-actions" = "display: none"; # Remove primary side bar action icons
    ".editor-actions" = "display: none"; # Remove editor action icons
    ".nosidebar .inline-tabs-placeholder" =
      "width: 75px"; # Align tabs to not overlap window controls when primary bar is hidden
  };
}
