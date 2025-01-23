{
  config.programs.firefox.profiles.dev-edition-default.settings = {
    "sidebar.verticalTabs" = true;
    "browser.uiCustomization.state" = builtins.toJSON {
      currentVersion = 20;
      newElementCount = 6;

      dirtyAreaCache = [
        "nav-bar"
        "PersonalToolbar"
        "toolbar-menubar"
        "TabsToolbar"
        "widget-overflow-fixed-list"
        "unified-extensions-area"
        "vertical-tabs"
      ];

      placements = {
        PersonalToolbar = [ "personal-bookmarks" ];
        vertical-tabs = [ "tabbrowser-tabs" ];
        toolbar-menubar = [ "menubar-items" ];
        widget-overflow-fixed-list = [ ];
        unified-extensions-area = [ ];
        TabsToolbar = [ ];
        nav-bar = [
          "sidebar-button"
          "back-button"
          "forward-button"
          "stop-reload-button"
          "urlbar-container"
          "downloads-button"
          "unified-extensions-button"
        ];
      };

      seen = [ "developer-button" ];
    };
  };
}
