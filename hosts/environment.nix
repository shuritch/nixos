# This file SHOULD contain all environment variables definitions
# Host MUST NOT containt any unique environment variable

lib: {
  flake-github = "sashapop10/nixos";
  flake-location = "$HOME/Desktop/OS"; # Move flake here !
  host = "nameless"; # Will be replaced by default.nix
  origin = "24.05"; # Replace by latest
  platform = "x86_64-linux";

  admin = {
    login = "sashapop10";
    email = "sashapop10@yandex.ru";
    description = "Alexander Ivanov";
    hashedPassword = # mkpasswd
      "$y$j9T$7q5upyxvLUC/BL6pEeZy/.$RfAhy7zm1lTecMFFtiuDzWA.1sf6mcz45V2W2Xw0m9A";
  };

  hosts = builtins.attrNames
    (lib.filterAttrs (path: _type: (_type == "directory"))
      (builtins.readDir ./.));

  permitedInsecurePackages =
    [ "python-2.7.18.8" "electron-25.9.0" "electron-24.8.6" ];
}
