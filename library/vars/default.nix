{ lib, ... }: {
  origin = "23.11";
  flake-github = "sashapop10/nixos";
  flake-location = "$HOME/Desktop/Os";
  admin = {
    login = "sashapop10";
    email = "sashapop10@yandex.ru";
    description = "Alexander Ivanov";
    password =
      "$y$j9T$7q5upyxvLUC/BL6pEeZy/.$RfAhy7zm1lTecMFFtiuDzWA.1sf6mcz45V2W2Xw0m9A";
  };

  relativeToRoot = lib.path.append ../.;
  require = path:
    builtins.map (f: (path + "/${f}")) (builtins.attrNames
      (lib.attrsets.filterAttrs (path: _type:
        (_type == "directory")
        || ((path != "default.nix") && (lib.strings.hasSuffix ".nix" path)))
        (builtins.readDir path)));
}
