{ outputs, ... }: {
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      allowUnsupportedSystem = true;
      allowAliases = true;
      allowBroken = false;

      permittedInsecurePackages = [
        "python-2.7.18.8"
        "electron-25.9.0"
        "electron-24.8.6"

      ];
    };
  };
}
