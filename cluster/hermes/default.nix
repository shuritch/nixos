{ config, ... }: {
  imports = [ ./hardware-configuration.nix ./config ];

  my.system = {
    stateVersion = "24.05";
    users.${config.my.system.admin} = {
      description = "Alexander Ivanov";
      email = "sashapop10@yandex.ru";
      hashedPassword = # mkpasswd
        "$y$j9T$7q5upyxvLUC/BL6pEeZy/.$RfAhy7zm1lTecMFFtiuDzWA.1sf6mcz45V2W2Xw0m9A";
    };
  };

  my.programs = { nh.enable = true; };
  my.network = {
    wirelessBackend = "iwd";
    firewall.ui = true;
    optimizeTcp = true;
  };

  my.services = {
    seatd.enable = true;
    polkit-agent.enable = true;
    earlyroom.enable = true;
    syncthing = {
      enable = true;
      devices = {
        atlas.id =
          "EKW632J-PBADOOQ-DMNGULQ-IBQW6CL-UXOYAUZ-MQDGWQL-PXSMJLF-CSAF3AC";
        hermes.id =
          "LDOSJMI-PYAMCGH-RF56NYE-X2IVTQE-DZIJKEY-7J57GTF-ULW7E67-HSROFQW";
      };

      folders = {
        "sync" = {
          path = "/home/${config.my.system.admin}/sync";
          devices = [ "atlas" "hermes" ];
        };
        "documents" = {
          path = "/home/${config.my.system.admin}/documents";
          devices = [ "atlas" "hermes" ];
        };
        "music" = {
          path = "/home/${config.my.system.admin}/music";
          devices = [ "atlas" "hermes" ];
        };
        "desktop" = {
          path = "/home/${config.my.system.admin}/desktop";
          devices = [ "atlas" "hermes" ];
        };
        "videos" = {
          path = "/home/${config.my.system.admin}/videos";
          devices = [ "atlas" "hermes" ];
        };
        "pictures" = {
          path = "/home/${config.my.system.admin}/pictures";
          devices = [ "atlas" "hermes" ];
        };
      };
    };
  };
}
