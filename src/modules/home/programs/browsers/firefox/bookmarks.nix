{
  config.programs.firefox.profiles.dev-edition-default.bookmarks = [
    {
      name = "NIX";
      toolbar = true;
      bookmarks = [
        {
          name = "NIX Language";
          url = "https://nix.dev/manual/nix/2.18/language/";
        }
        {
          name = "NIX Lib";
          url = "https://ryantm.github.io/nixpkgs";
        }
        {
          name = "NIX Types";
          url = "https://nixos.wiki/wiki/Declaration";
        }
        {
          name = "NIX Modules";
          url =
            "https://nlewo.github.io/nixos-manual-sphinx/development/option-types.xml.html";
        }
        {
          name = "Syncthing";
          url = "http://127.0.0.1:8384";
        }
      ];
    }
    {
      name = "JS";
      toolbar = true;
      bookmarks = [
        {
          name = "ECMA";
          url = "https://tc39.es/ecma262/?search=ecma";
        }
        {
          name = "JS Proposals";
          url = "https://github.com/tc39/proposals";
        }
      ];
    }
    {
      name = "SEO";
      toolbar = true;
      bookmarks = [
        {
          name = "HTML Heading";
          url = "https://html.spec.whatwg.org/#heading-content";
        }
        {
          name = "HTML Phrasing";
          url = "https://html.spec.whatwg.org/#phrasing-content";
        }
        {
          name = "HTML Microdata";
          url = "https://html.spec.whatwg.org/#introduction-7";
        }
        {
          name = "Schemaorg";
          url =
            "https://developers.google.com/search/docs/appearance/structured-data/search-gallery";
        }
        {
          name = "Dorks";
          url = "https://habr.com/ru/companies/postuf/articles/510766/";
        }
      ];
    }
    {
      name = "Other";
      toolbar = true;
      bookmarks = [{
        name = "WebRTC";
        url = "https://mozilla.github.io/webrtc-landing/";
      }];
    }
  ];
}
