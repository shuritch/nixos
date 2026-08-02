{ config, myLib, ... }:

let cfg = config;
in {
  options.my.security = {
    # Doesn't require options
  };

  config.security = { # Polkit will log all actions
    polkit.enable = true; # 👇 This adds GUI to enter password
    soteria.enable = myLib.testHM cfg "desktop.enable";
  };
}
