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
      serviceConfig = { Type = "oneshot"; };

      preStart = ''
        export XDG_RUNTIME_DIR="/run/user/1001"
        HYPRLAND_INSTANCE_SIGNATURE=$(${pkgs.findutils}/bin/find "$XDG_RUNTIME_DIR/hypr/" -maxdepth 1 -type d | ${pkgs.gnugrep}/bin/grep -v "^$XDG_RUNTIME_DIR/hypr/$" | ${pkgs.gawk}/bin/awk -F'/' '{print $NF}')
        export HYPRLAND_INSTANCE_SIGNATURE
      '';

      environment = {
        DISPLAY = ":0";
        WAYLAND_DISPLAY = "wayland-1";
      };
    };
  };
}
