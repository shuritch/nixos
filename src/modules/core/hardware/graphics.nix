{ lib, config, pkgs, myLib, ... }:

let cfg = config;
in {
  options.my.hardware = {
    # Defined in home modules
  };

  config = lib.mkIf (myLib.testHM cfg "desktop.enable") {
    hardware.graphics = {
      enable = true;
      enable32Bit = pkgs.stdenv.hostPlatform.isLinux
        && pkgs.stdenv.hostPlatform.isx86;
    };

    programs.xwayland.enable = true;
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = [ "gtk" ];
      wlr = {
        enable = true;
        settings.screencast = {
          max_fps = 60;
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        };
      };
    };

    environment.variables = {
      NIXOS_OZONE_WL = "1";
      _JAVA_AWT_WM_NONEREPARENTING = "1";
      GDK_BACKEND = "wayland,x11";
      ANKI_WAYLAND = "1";
      MOZ_ENABLE_WAYLAND = "1";
      XDG_SESSION_TYPE = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      MOZ_WEBRENDER = "1";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      QT_QPA_PLATFORM = "wayland";
      LIBSEAT_BACKEND = "logind";
      # GTK_USE_PORTAL = "1";
      #WLR_DRM_NO_ATOMIC = "1";
      #WLR_BACKEND = "vulkan";
      #__GL_GSYNC_ALLOWED = "0";
      #__GL_VRR_ALLOWED = "0";
    };

    programs.dconf.enable = true;
    services.dbus = {
      enable = true;
      implementation = "broker";
      packages = builtins.attrValues { inherit (pkgs) dconf gcr_4 udisks; };
    };

    services.xserver = {
      enable = false;
      desktopManager.xterm.enable = false;
      excludePackages = [ pkgs.xterm ];
    };
  };
}
