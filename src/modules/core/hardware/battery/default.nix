{ lib, pkgs, config, ... }: {
  imports = [ ./cpufreq.nix ./undervolt.nix ./upower.nix ];
  options.my.hardware.battery.enable = lib.mkEnableOption "Enable battery api.";
  options.my.hardware.battery.alert = lib.mkEnableOption "Enable power alert.";
  config = lib.mkIf config.my.hardware.battery.alert {
    systemd.services.battery-alert = {
      enable = true;
      description = "Battery capacity alerts.";
      wantedBy = [ "graphical.target" ];
      after = [ "graphical.target" ];
      serviceConfig = { Type = "oneshot"; };

      script = ''
        #!/usr/bin/env bash
        while true; do
        	battery_status="$(cat /sys/class/power_supply/BAT*/status)"
        	battery_charge="$(cat /sys/class/power_supply/BAT*/capacity)"

        	if [[ $battery_status == 'Discharging' && $battery_charge -le 20 ]]; then
        		if [[ $battery_charge -le 10 ]]; then
        			${pkgs.libnotify}/bin/notify-send --urgency=critical "Critical Battery!" "󰁺 $battery_charge%"
        		else
        			${pkgs.libnotify}/bin/notify-send "Low Battery !" "󰁼 $battery_charge%"
        		fi
        	fi

          sleep 600
        done
      '';
    };
  };
}
