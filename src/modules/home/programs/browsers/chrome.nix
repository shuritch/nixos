{ pkgs, lib, config, ... }:

let cfg = config.my.home;
in {
  options.my.home.programs.chrome.enable =
    lib.mkEnableOption "Enable chromium.";

  config.programs.chromium =
    lib.mkIf (cfg.desktop.enable && cfg.programs.chrome.enable) {
      enable = true;
      commandLineArgs =
        [ "--no-default-browser-check" "--restore-last-sesion" ];
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

      package = pkgs.chromium.override {
        enableWideVine = true;
        commandLineArgs = [
          # Aesthetics
          "--force-dark-mode"
          # Performance
          "--enable-gpu-rasterization"
          "--enable-oop-rasterization"
          "--enable-zero-copy"
          "--ignore-gpu-blocklist"
          # Etc
          "--gtk-version=4"
          "--disk-cache=$XDG_RUNTIME_DIR/chromium-cache"
          "--no-default-browser-check"
          "--no-service-autorun"
          "--disable-features=PreloadMediaEngagementData,MediaEngagementBypassAutoplayPolicies"
          "--disable-reading-from-canvas"
          "--no-pings"
          "--no-first-run"
          "--no-experiments"
          "--no-crash-upload"
          "--disable-wake-on-wifi"
          "--disable-breakpad"
          "--disable-sync"
          "--disable-speech-api"
          "--disable-speech-synthesis-api"
        ] ++ lib.optionals (config.my.home.desktop.isWayland) [
          "--ozone-platform=wayland"
          "--enable-features=UseOzonePlatform"
        ];
      };
    };
}
