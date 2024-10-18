{ config, ... }: {
  imports = [ ./hardware-configuration.nix ./config ];
  my.programs.nh.enable = true;
  my.system.users.${config.my.system.admin} = {
    description = "Alexander Ivanov";
    email = "sashapop10@yandex.ru";
    hashedPassword = # mkpasswd
      "$y$j9T$7q5upyxvLUC/BL6pEeZy/.$RfAhy7zm1lTecMFFtiuDzWA.1sf6mcz45V2W2Xw0m9A";
  };
}
