{
  programs.waybar.settings.primary = {
    network = {
      interval = 3;
      max-length = 20;
      format-wifi = "    {essid}";
      format-ethernet = "󰈁   Connected";
      format-disconnected = "󰇨   Disconnected";
      on-click = "nm-connection-editor";
      tooltip-format = ''
        {ifname} = {ipaddr}/{cidr}
        U: {bandwidthUpBits} / D: {bandwidthDownBits}'';
    };

    bluetooth = {
      format = "󰂯";
      max-length = 35;
      on-click = "blueman-manager";
      format-disabled = "󰂲  NaN";
      format-connected = "󰂱   {device_alias}";
      format-connected-battery =
        "󰂱   {device_alias} (󰥉 {device_battery_percentage}%)";

      tooltip-format-disabled = "bluetooth off";
      tooltip-format = "{controller_alias}	{controller_address} ({status})";
      tooltip-format-connected = ''
        {controller_alias}	{controller_address} ({status})
        {device_enumerate}'';

      tooltip-format-enumerate-connected = "{device_alias}	{device_address}";

      tooltip-format-enumerate-connected-battery =
        "{device_alias}	{device_address}	({device_battery_percentage}%)";
    };
  };
}
