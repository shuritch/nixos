{
  systemd.services.wpa_supplicant.preStart = "touch /etc/wpa_supplicant.conf";
  users.groups.network = { };
  networking.wireless = {
    enable = true;
    fallbackToWPA2 = false;
    allowAuxiliaryImperativeNetworks = true;
    networks = { };
    userControlled = {
      enable = true;
      group = "network";
    };

    extraConfig = ''
      update_config=1
    '';
  };
}
