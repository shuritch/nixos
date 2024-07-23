{ pkgs, env-config, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;
    languagePacks = [ "ru" "en-US" ];
    profiles.${env-config.user.login} = {
      bookmarks = {
        SEO = [
          {
            name = "Whatwg Heading";
            tags = [ "whatwg" "seo" ];
            keyword = "heading-content";
            url = "https://html.spec.whatwg.org/#heading-content";
          }
          {
            name = "Whatwg Phrasing";
            tags = [ "whatwg" "seo" ];
            keyword = "phrasing-content";
            url = "https://html.spec.whatwg.org/#phrasing-content";
          }
          {
            name = "Whatwg microdata";
            tags = [ "whatwg" "seo" ];
            keyword = "microdata";
            url = "https://html.spec.whatwg.org/#introduction-7";
          }
          {
            name = "Schemaorg";
            tags = [ "whatwg" "seo" ];
            keyword = "schemaorg";
            url =
              "https://developers.google.com/search/docs/appearance/structured-data/search-gallery";
          }
        ];
      };

      extensions = with pkgs.inputs.firefox-addons; [
        bitwarden
        plasma-integration
        ublock-origin
        wappalyzer
        sponsorblock
        simple-translate
        grammarly-1
        youtube-shorts-block
      ];

      search.force = true;
      search.engines = {
        "Nix Packages" = {
          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/nix-showflake.svg";
          definedAliases = [ "@np" ];
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];
        };
        "Nix Options" = {
          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/nix-showflake.svg";
          definedAliases = [ "@no" ];
          urls = [{
            template = "https://search.nixos.org/options";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];
        };
        "Youtube" = {
          definedAliases = [ "@youtube" ];
          urls = [{
            template = "https://www.youtube.com/results";
            params = [{
              name = "search_query";
              value = "{searchTerms}";
            }];
          }];
        };
        "Yandex" = {
          definedAliases = [ "@yandex" ];
          urls = [{
            template = "https://yandex.ru/search";
            params = [{
              name = "text";
              value = "{searchTerms}";
            }];
          }];
        };
      };

      settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.download.useDownloadDir" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = true;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "browser.uiCustomization.state" = ''
          {"placements":{"widget-overflow-fixed-list":[],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":18,"newElementCount":4}'';
        "dom.security.https_only_mode" = true;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = false;
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
