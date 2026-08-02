{ outputs, ... }:

let
in {
  options.my.system = {
    # Doesn't require options
  };

  config.nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      allowUnsupportedSystem = false;
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
