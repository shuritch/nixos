# Optional services

```nix
{
  my.services = {
    docker.enable = false;
    podman.enable = false;
    postgresql.enable = false;
    printing.enable = false;
    syncthing = {
      enable = false;
      devices = {};
      folders = {};
    }
  };
}
```
