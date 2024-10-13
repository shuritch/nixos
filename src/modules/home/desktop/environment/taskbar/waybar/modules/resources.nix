{ myLib, pkgs, ... }:

let mkScript = myLib.mkWaybarScript pkgs;
in {
  programs.waybar.settings.primary = {
    cpu = {
      format = "  ";
      tooltip-format = "{usage}%";
    };

    memory = {
      format = "  ";
      interval = 30;
      tooltip-format = "{percentage}%";
    };

    disk = {
      interval = 30;
      format = "󰋊  ";
      tooltip-format = "{used}/{total}";
    };

    battery = {
      bat = "BAT0";
      interval = 10;
      format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      format = "{icon} {capacity}%";
      format-charging = " {capacity}%";
      format-discharging = "{icon} {capacity}%";
      format-alt = "{time} {icon}";
      onclick = "";
      states = {
        good = 95;
        warning = 30;
        critical = 20;
      };
    };

    "custom/gpu-amd" = {
      interval = 30;
      format = "󰒋  ";
      tooltip-format = "{}%";
      exec = mkScript {
        script = "cat /sys/class/drm/card0/device/gpu_busy_percent";
      };
    };

    "custom/gpu-nvidia" = {
      interval = 30;
      format = "󰒋  ";
      tooltip-format = "{}%";
      exec = mkScript {
        deps = [ "nvidia-smi" ];
        script =
          "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
      };
    };
  };
}
