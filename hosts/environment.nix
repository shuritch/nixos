{ lib, ... }: {
  flake-github = "sashapop10/nixos";
  flake-location = "$HOME/Desktop/OS"; # Move flake here !
  admin = {
    login = "sashapop10";
    email = "sashapop10@yandex.ru";
    description = "Alexander Ivanov";
    password = # mkpasswd
      "$y$j9T$7q5upyxvLUC/BL6pEeZy/.$RfAhy7zm1lTecMFFtiuDzWA.1sf6mcz45V2W2Xw0m9A";
  };

  hosts = builtins.attrNames
    (lib.filterAttrs (path: _type: (_type == "directory"))
      (builtins.readDir ./.));
}
