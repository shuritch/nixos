{ config, ... }: {
  my.services = {
    seatd.enable = true;
    podman.enable = true;
    postgresql.enable = false;
    printing.enable = true;
    earlyroom.enable = true;
    syncthing = {
      enable = true;
      devices = {
        atlas.id =
          "NX7XAXN-YMGZCY4-WB6FD44-P2QQWAS-Q5Q4RRG-X2ZXXT5-65YGAWP-ZLQ5TQU";
        hermes.id =
          "2ACD7PM-2DAZYOF-ADMLLVS-FTL6MED-HWH2Z3D-UQKWCCU-MGLWNPY-63YGLAI";
      };

      folders = {
        "dev" = {
          path = "/home/${config.my.system.admin}/dev";
          devices = [ "atlas" "hermes" ];
        };
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
