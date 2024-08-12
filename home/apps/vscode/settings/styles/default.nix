config:

let mono-font = config.fontProfiles.monospace.family;
in {
  "apc.imports" = [ (builtins.toString ./style.css) ];
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
}
