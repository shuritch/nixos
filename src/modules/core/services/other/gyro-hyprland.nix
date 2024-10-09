{ pkgs, config, lib, ... }: {
  options.hardware.gyro-hyprland.enable =
    lib.mkEnableOption "Enable gyro-hyprland";

  config = lib.mkIf config.hardware.gyro-hyprland.enable {
    hardware.sensor.iio.enable = true;
    systemd.services.gyro-hyprland = {
      enable = true;
      name = "gyro-hyprland.service";
      path = with pkgs; [ (lib.getExe' hyprland "hyprctl") ];
      description = "Enables gyro-hyprland";
      wantedBy = [ "graphical.target" ];
      after = [ "graphical.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.gyro-hyprland}/bin/gyro-hyprland";
      };
    };
  };
}
