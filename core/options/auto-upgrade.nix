{ inputs, myEnv, ... }: {
  system.autoUpgrade = {
    enable = inputs.self ? rev;
    allowReboot = true;
    flags = [ "--accept-flake-config" ];
    flake = "github:${myEnv.flake-github}";
    randomizedDelaySec = "60min";
    operation = "switch";
    persistent = true;
    dates = "02:00";
    rebootWindow = {
      lower = "02:00";
      upper = "06:00";
    };
  };
}
