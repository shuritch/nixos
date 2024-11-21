{ lib, ... }: {
  config.programs.firefox.profiles.dev-edition-default.settings = {
    # Disable firefox intro tabs on the first start
    # Disable the first run tabs with advertisements for the latest firefox features.
    "browser.startup.homepage_override.mstone" = "ignore";

    # Disable new tab page intro
    # Disable the intro to the newtab page on the first run
    "browser.newtabpage.introShown" = false;

    # Pocket Reading List
    # No details
    "extensions.pocket.enabled" = false;
    "browser.newtabpage.activity-stream.section.highlights.includePocket" =
      false;

    # Disable Sponsored Top Sites
    # Firefox 83 introduced sponsored top sites
    # (https://support.mozilla.org/en-US/kb/sponsor-privacy), which are sponsored ads
    # displayed as suggestions in the URL bar.
    "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite" =
      false;

    # Disable about:config warning.
    # No details
    "browser.aboutConfig.showWarning" = false;

    # Do not trim URLs in navigation bar
    # By default Firefox trims many URLs (hiding the http:// prefix and trailing slash
    # /).
    "browser.urlbar.trimURLs" = false;

    # Disable checking if Firefox is the default browser
    # No details
    "browser.shell.checkDefaultBrowser" = false;

    # Disable reset prompt.
    # When Firefox is not used for a while, it displays a prompt asking if the user
    # wants to reset the profile. (see Bug #955950
    # (https://bugzilla.mozilla.org/show_bug.cgi?id=955950)).
    "browser.disableResetPrompt" = true;

    # Disable Heartbeat Userrating
    # With Firefox 37, Mozilla integrated the Heartbeat
    # (https://wiki.mozilla.org/Advocacy/heartbeat) system to ask users from time to
    # time about their experience with Firefox.
    "browser.selfsupport.url" = "";
    # Content of the new tab page
    "browser.newtabpage.enhanced" = false;

    # Disable autoplay of <code>&lt;video&gt;</code> tags.
    # Per default, <code>&lt;video&gt;</code> tags are allowed to start automatically.
    # Note: When disabling autoplay, you will have to click pause and play again on
    # some video sites.
    "media.autoplay.enabled" = true;
    "media.autoplay.default" = 0;

    # Disable irritating first-run stuff
    "browser.download.panel.shown" = true;
    "browser.feeds.showFirstRunUI" = false;
    "browser.messaging-system.whatsNewPanel.enabled" = false;
    "browser.rights.3.shown" = true;
    "browser.shell.defaultBrowserCheckCount" = 1;
    "browser.uitour.enabled" = false;
    "startup.homepage_override_url" = "";
    "trailhead.firstrun.didSeeAboutWelcome" = true;
    "browser.bookmarks.restore_default_bookmarks" = false;
    "browser.bookmarks.addedImportButton" = true;

    # Don't ask for download dir
    "browser.download.useDownloadDir" = true;

    # Disable crappy home activity stream page
    "browser.newtabpage.activity-stream.feeds.topsites" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" =
      false;

    # Block automatic new tabs
    "browser.newtabpage.blocked" = lib.genAttrs [
      "26UbzFJ7qT9/4DhodHKA1Q==" # Youtube
      "4gPpjkxgZzXPVtuEoAL9Ig==" # Facebook
      "eV8/WsSLxHadrTL1gAxhug==" # Wikipedia
      "gLv0ja2RYVgxKdp0I5qwvA==" # Reddit
      "K00ILysCaEq8+bEqV/3nuw==" # Amazon
      "T9nJot5PurhJSy8n038xGA==" # Twitter
    ] (_: 1);
  };
}
