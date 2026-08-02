{ lib, config, pkgs, myLib, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware = {
    audio = lib.mkEnableOption "Enable audio hardware.";
  };

  config = lib.mkIf cfg.audio {
    services.playerctld.enable = true;
    services.pulseaudio.enable = lib.mkForce false;
    security.rtkit.enable = true; # scheduling

    environment.systemPackages =
      lib.optionals (myLib.testHM config "desktop.enable") [
        pkgs.pamixer
        pkgs.pavucontrol
      ];

    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      audio.enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = pkgs.stdenv.hostPlatform.isLinux
          && pkgs.stdenv.hostPlatform.isx86;
      };

      extraConfig.pipewire = {
        "10-loopback" = {
          "context.modules" = [{
            "node.description" = "playback loop";
            "audio.position" = [ "FL" "FR" ];

            "capture.props" = {
              "node.name" = "playback_sink";
              "node.description" = "playback-sink";
              "media.class" = "Audio/Sink";
            };

            "playback.props" = {
              "node.name" = "playback_sink.output";
              "node.description" = "playback-sink-output";
              "media.class" = "Audio/Source";
              "node.passive" = true;
            };
          }];
        };
      };
    };

    systemd.user.services = {
      pipewire.wantedBy = [ "default.target" ];
      pipewire-pulse.wantedBy = [ "default.target" ];
    };
  };
}
