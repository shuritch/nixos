# Bootstrap configuration

```nix
{
  my.boot = {
    # Loader
    loader = "none"; # "grub" | "systemd-boot"
    systemdMemtest = false;
    systemdTheme = null; # pkg or string name
    grubDevice = "nodev";
    grubTheme = null; # pkg
    silentBoot = config.plymouth.enable; # Enabled when systemdTheme is set

    # Tweaks
    kernelTweaks = false;
    tmpOnTmpfs = false;
    kernel = pkgs.linuxPackages_latest;
    emulatedSystems = [];
  };
}
```
