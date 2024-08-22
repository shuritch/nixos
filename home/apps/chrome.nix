{ ... }: {
  programs.chromium = {
    enable = true;
    # package = pkgs.brave;

    commandLineArgs = [ "--no-default-browser-check" "--restore-last-sesion" ];

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
