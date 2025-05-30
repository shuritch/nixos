# Ты знаешь что такое SEO ?
# Разницу CRM / CMS
# Как у тебя вообще с фронтом / технологиями
# Какой у тебя опыт фул стек разработки
# В каких процессах бэкенд разработки ты участвовал

{ lib, pkgs, config, ... }: {
  services.gpg-agent = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    enable = true;
    enableScDaemon = true;
    enableSshSupport = true;
    defaultCacheTtl = 1209600;
    defaultCacheTtlSsh = 1209600;
    maxCacheTtl = 1209600;
    maxCacheTtlSsh = 1209600;
    extraConfig = "allow-preset-passphrase";
    pinentry.package = if config.my.home.desktop.enable then
      pkgs.pinentry-gnome3 # requires services.dbus.packages = [ pkgs.gcr ]
    else
      pkgs.pinentry-curses;
  };

  # Allow manually restarting gpg-agent if it fails
  systemd.user.services.gpg-agent.Unit.RefuseManualStart = lib.mkForce false;

  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
    settings = {
      keyserver = "keys.openpgp.org";
      # https://github.com/drduh/config/blob/master/gpg.conf
      # https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration-Options.html
      # https://www.gnupg.org/documentation/manuals/gnupg/GPG-Esoteric-Options.html
      personal-cipher-preferences = "AES256 AES192 AES"; # Cipher 256, 192, 128
      personal-digest-preferences = "SHA512 SHA384 SHA256"; # Digest 512,384,256
      # Use ZLIB, BZIP2, ZIP, or no compression
      personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
      default-preference-list = # Default preferences for new keys
        "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
      cert-digest-algo = "SHA512"; # SHA512 as digest to sign keys
      s2k-digest-algo = "SHA512"; # SHA512 as digest for symmetric ops
      s2k-cipher-algo = "AES256"; # AES256 as cipher for symmetric ops
      charset = "utf-8"; # UTF-8 support for compatibility
      fixed-list-mode = ""; # Show Unix timestamps
      no-comments = ""; # No comments in signature
      no-emit-version = ""; # No version in signature
      no-greeting = ""; # Disable banner
      keyid-format = "0xlong"; # Long hexadecimal key format
      # Display UID validity
      list-options = "show-uid-validity";
      verify-options = "show-uid-validity";
      with-fingerprint = ""; # Display all keys and their fingerprints
      require-cross-certification = ""; # Cross-certify subkeys are valid
      no-symkey-cache = ""; # Disable caching of passphrase for symmetrical ops
      use-agent = ""; # Enable smartcard
      armor = ""; # Output ASCII instead of binary
      throw-keyids = ""; # Disable recipient key ID in messages
    };
  };
}
