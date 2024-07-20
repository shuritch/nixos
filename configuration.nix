{ config, lib, pkgs, ... }:

{
  imports = [
    # <home-manager/nixos>
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/users/sashapop10.nix
    /etc/nixos/packages.nix
  ];

  system.stateVersion = "23.11"; # 24.05
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false; # Changable ?
  services.printing.enable = true;

  #? Perfomance ?
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  #? Systemd Dualboot
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 25;
    };
  };

  # ? GRUB Dualboot
  # boor.loader = {
  #   efi = {
  #     canTouchEfiVariables = true;
  #     efiSysMountPoint = "/boot/efi";
  #   };
  #   grub = {
  #     devices = [ "nodev" ];
  #     enable = true;
  #     #efiInstallAsRemovable = true;
  #     configurationLimit = 25;
  #     efiSupport = true;
  #     useOSProber = true;
  #   };
  # }

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  time.hardwareClockInLocalTime = true;
  i18n.supportedLocales = [
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
  ];
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    powerManagement.finegrained = false;
    powerManagement.enable = false;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

  services.displayManager = {
    sddm.enable = true;
    autoLogin = {
      enable = true;
      user = "sashapop10";
    };
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.variant = "workman,";
    xkb.options = "grp:alt_shift_toggle";
    videoDrivers = [ "nvidia" ];
    desktopManager.plasma5.enable = true;
  };

  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    dates = "weekly";
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;
  services.openssh = {
    enable = lib.mkForce true;
    ports = [ 2222 ];
    settings = {
      X11Forwarding = true;
    };
  };

  documentation = {
    enable = true;
    dev.enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
    man.man-db.enable = true;
    man.generateCaches = true;
    nixos.enable = true;
  };
}
