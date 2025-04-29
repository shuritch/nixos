{ ... }: {
  my.services = {
    seatd.enable = true;
    sing-box.enable = true;
    # podman.enable = true;
    docker.enable = true;
    printing.enable = true;
    earlyroom.enable = false;
  };
}
