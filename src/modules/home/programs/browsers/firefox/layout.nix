{
  config.programs.firefox.profiles.dev-edition-default.settings = {
    "browser.uiCustomization.state" = builtins.toJSON {
      currentVersion = 20;
      newElementCount = 5;
      dirtyAreaCache = [
        "nav-bar"
        "PersonalToolbar"
        "toolbar-menubar"
        "TabsToolbar"
        "widget-overflow-fixed-list"
      ];

      placements = {
        PersonalToolbar = [ "personal-bookmarks" ];
        toolbar-menubar = [ "menubar-items" ];
        widget-overflow-fixed-list = [ ];
        unified-extensions-area = [ ];
        TabsToolbar = [ "tabbrowser-tabs" "new-tab-button" "alltabs-button" ];
        nav-bar = [
          "back-button"
          "forward-button"
          "stop-reload-button"
          "urlbar-container"
          "downloads-button"
          "ublock0_raymondhill_net-browser-action"
          "_testpilot-containers-browser-action"
          "reset-pbm-toolbar-button"
          "unified-extensions-button"
        ];
      };

      seen = [
        "ublock0_raymondhill_net-browser-action"
        "_testpilot-containers-browser-action"
        "save-to-pocket-button"
        "developer-button"
      ];
    };
  };
}
