with builtins;

lib:
let
  hosts = attrNames (lib.filterAttrs (_: t: (t == "directory")) (readDir ./.));
  global = {
    flake-github = "sashapop10/nixos"; # For auto-upgrade module
    flake-location = "$HOME/Desktop/OS"; # $FLAKE Variable
    is-hm-standalone = false; # Will be replaced by hm loader
    origin = "24.05"; # Replace by latest
    platform = "x86_64-linux";
    users = [ "admin" ];

    admin = {
      login = "sashapop10";
      email = "sashapop10@yandex.ru";
      description = "Alexander Ivanov";
      hashedPassword = # mkpasswd
        "$y$j9T$7q5upyxvLUC/BL6pEeZy/.$RfAhy7zm1lTecMFFtiuDzWA.1sf6mcz45V2W2Xw0m9A";
    };

    permitedInsecurePackages = # ? Maybe remove it from here ?
      [ "python-2.7.18.8" "electron-25.9.0" "electron-24.8.6" ];
  };
in lib.genAttrs hosts (host:
  let
    path = lib.path.append ./. "${host}/environment.nix";
    env = lib.optionalAttrs (lib.pathExists path) import path lib;
  in global // env // { inherit host hosts; })
