[
  {
    "key" = "alt alt";
    "command" = "workbench.action.showCommands";
  }
  {
    "key" = "ctrl ctrl";
    "command" = "workbench.action.toggleSidebarVisibility";
  }
  {
    "key" = "shift shift";
    "command" = "workbench.action.toggleSidebarVisibility";
  }
  {
    "key" = "alt+backspace";
    "command" = "editor.action.deleteLines";
    "when" = "textInputFocus && !editorReadonly";
  }
  {
    "key" = "alt+right";
    "command" = "cursorEnd";
    "when" = "textInputFocus";
  }
  {
    "key" = "alt+left";
    "command" = "cursorHome";
    "when" = "textInputFocus";
  }
  # Unbind
  {
    "key" = "ctrl+shift+k";
    "command" = "-editor.action.deleteLines";
    "when" = "textInputFocus";
  }
  {
    "key" = "home";
    "command" = "-cursorHome";
    "when" = "textInputFocus";
  }
  {
    "key" = "ctrl+shift+k";
    "command" = "-cursorHome";
    "when" = "textInputFocus";
  }
]
