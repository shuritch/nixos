{ ... }: {
  my.services = {
    seatd.enable = true;
    podman.enable = true;
    printing.enable = true;
    earlyroom.enable = false;
    postgresql = {
      enable = true;
      enableAdmin = true;
    };
  };
}
