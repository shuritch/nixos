{ pkgs, config, lib, ... }: {
  options.my.services.iio-hyprland.enable =
    lib.mkEnableOption "Enable iio-hyprland";

  config = lib.mkIf config.my.services.iio-hyprland.enable {
    hardware.sensor.iio.enable = true;
    systemd.services.iio-hyprland = {
      enable = true;
      name = "iio-hyprland.service";
      path = with pkgs; [ hyprland ];
      description = "Enables iio-hyprland";
      wantedBy = [ "graphical.target" ];
      after = [ "graphical.target" ];
      script = "${pkgs.iio-hyprland}/bin/iio-hyprland";
      serviceConfig = {
        PassEnvironment = [ "DISPLAY" "HYPRLAND_INSTANCE_SIGNATURE" ];
        Type = "oneshot";
      };
    };
  };
}
