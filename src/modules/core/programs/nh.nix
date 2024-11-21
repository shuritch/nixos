{ lib, config, ... }: {
  options.my.programs.nh.enable = lib.mkEnableOption "Enable nh";
  config.programs.nh = { # nixos-rebuild -> nh os switch
    enable = config.my.programs.nh.enable;
    clean = { # Using gc
      enable = false;
      dates = "weekly";
    };
  };
}
