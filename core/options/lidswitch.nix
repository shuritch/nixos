{
  services.logind = {
    lidSwitch = "ignore";
    extraConfig = ''
      HandlePowerKey=ignore
    '';
  };

  programs.light.enable = true;
  services.acpid = {
    enable = true;
    lidEventCommands = ''
      export PATH=$PATH:/run/current-system/sw/bin

      lid_state=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $NF}')
      if [ $lid_state = "closed" ]; then
        # Set brightness to zero
        light -S 0
      else
        # Reset the brightness
        light -S 100
      fi
    '';

    powerEventCommands = ''
      systemctl suspend
    '';
  };
}
