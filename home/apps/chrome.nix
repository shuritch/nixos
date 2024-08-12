{ pkgs, config, ... }: {
  programs.chromium = {
    enable = true;
    # package = pkgs.brave;

    commandLineArgs = [ "--no-default-browser-check" "--restore-last-sesion" ];

    # extraOpts = {
    #   extraOpts.BrowserThemeColor = config.colorscheme.colors.surface;
    #   # OsColorMode = config.colorscheme.mode;
    #   BrowserSignin = 1;
    #   RestoreOnStartup = 1;
    #   BackgroundModeEnabled = true;
    #   HttpsOnlyMode = "force_enabled";
    #   WelcomePageOnOSUpgradeEnabled = false;
    #   SearchSuggestEnabled = true;
    #   DnsOverHttpsMode = "off";
    #   SpellcheckEnabled = true;
    #   SpellcheckLanguage = [ "ru" "en-US" ];
    #   NewTabPageLocation = "about:blank";
    #   AllowDeletingBrowserHistory = true;
    #   HideWebStoreIcon = true;
    #   ShowAppsShortcutInBookmarkBar = false;
    #   AlternateErrorPagesEnabled = false;
    #   AutofillCreditCardEnabled = true;
    #   BuiltInDnsClientEnabled = false;
    #   ColorCorrectionEnabled = true;
    #   AutofillAddressEnabled = true;
    #   PasswordManagerEnabled = true;
    #   CursorHighlightEnabled = true;
    #   EnableMediaRouter = false;
    #   BookmarkBarEnabled = true;
    #   SyncDisabled = false;

    #   MetricsReportingEnabled = false;
    #   BlockThirdPartyCookies = false;
    #   PrivacySandboxAdMeasurementEnabled = false;
    #   PrivacySandboxAdTopicsEnabled = false;
    #   PrivacySandboxSiteEnabledAdsEnabled = false;
    #   UrlKeyedAnonymizedDataCollectionEnabled = false;
    #   DefaultBrowserSettingEnabled = false;
    #   SafeBrowsingProtectionLevel = 0;
    #   PromotionalTabsEnabled = false;
    #   CloudPrintSubmitEnabled = false;
    # };

    # { id = "ibplnjkanclpjokhdolnendpplpjiace"; } # Simple Translate
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "oldceeleldhonbafppcapldpdifcinji"; } # Grammar
      { id = "flbjommegcjonpdmenkdiocclhjacmbi"; } # HeadingsMap
      { id = "cimiefiiaegbelhefglklhhakcgmhkai"; } # Plasma Integration
      { id = "cofdbpoegempjloogbagkncekinflcnj"; } # DeepL Translate
      { id = "hddnkoipeenegfoeaoibdmnaalmgkpip"; } # Toby
      { id = "jiaopdjbehhjgokpphdfgmapkobbnmjp"; } # Youtube-shorts block
      { id = "gebbhagfogifgggkldgodflihgfeippi"; } # Dislike
      { id = "fddjpichkajmnkjhcmpbbjdmmcodnkej"; } # RuTracker
      { id = "ahfhijdlegdabablpippeagghigmibma"; } # Web Vitals
      { id = "gmegofmjomhknnokphhckolhcffdaihd"; } # JSONView
      { id = "gkojfkhlekighikafcpjkiklfbnlmeio"; } # Hola vpn
      { id = "hipncndjamdcmphkgngojegjblibadbe"; } # Planet vpn
      { id = "fjnpfdnpkpdccebgadceaieifiiblabh"; } # Color picker
      { id = "gppongmhjkpfnbhagpmjfkannfbllamg"; } # wappalyzer
    ];
  };
}
