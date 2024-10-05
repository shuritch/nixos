{ pkgs, config, lib, ... }: {
  options.hardware.gyro-hyprland.enable =
    lib.mkEnableOption "Enable gyro-hyprland";

  config = lib.mkIf config.hardware.gyro-hyprland.enable {
    hardware.sensor.iio.enable = true;
    systemd.services.gyro-hyprland = {
      enable = true;
      name = "gyro-hyprland";
      description = "Enables gyro-hyprland";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "oneshot";
        Restart = "no";
        ExecStart = "${pkgs.gyro-hyprland}/bin/gyro-hyprland";
      };
    };
  };
}
