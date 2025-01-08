{ pkgs, lib, config, myLib, ... }:

let cfg = config.my.hardware;
in {
  options.my.hardware.audio = lib.mkEnableOption "Enable audio hardware.";
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
      audio.enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = pkgs.stdenv.hostPlatform.isLinux
          && pkgs.stdenv.hostPlatform.isx86;
      };

      wireplumber = {
        enable = true;
        extraConfig = lib.mkMerge [
          { # Tell wireplumber to be more verbose 👇
            "10-log-level-debug"."context.properties"."log.level" = "D";
            "10-default-volume"."wireplumber.settings"."device.routes.default-sink-volume" =
              1.0; # Default volume is by default set to 0.4 instead of 1.0

            "60-hdmi-lowprio" = {
              "monitor.alsa.rules" = lib.singleton {
                matches = lib.singleton { "api.alsa.path" = "hdmi:.*"; };
                actions.update-props = {
                  "node.name" = "Low Priority HDMI";
                  "node.nick" = "Low Priority HDMI";
                  "node.description" = "Low Priority HDMI";
                  "priority.session" = 100;
                  "node.pause-on-idle" = true;
                };
              };
            };

            "60-onboard-card" = {
              "monitor.alsa.rules" = lib.singleton {
                matches = [{ "media.class" = "Audio/Device"; }];
                actions.update-props = {
                  "node.name" = "Onboard Audio";
                  "node.description" = "Onboard Audio";
                  "node.nick" = "Onboard Audio";
                };
              };
            };
          }

          (lib.mkIf config.my.hardware.bluetooth {
            "10-bluez"."monitor.bluez.rules" = lib.singleton {
              matches = lib.singleton { "device.name" = "~bluez_card.*"; };
              actions.update-props = {
                "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
                "bluez5.a2dp.ldac.quality" = "hq"; # High quality audio
                "bluez5.enable-hw-volume" = true;
                "bluez5.enable-sbc-xq" = true;
                "bluez5.enable-msbc" = true;
              };
            };
          })
        ];
      };

      extraConfig = {
        pipewire = {
          "10-logging"."context.properties"."log.level" = 3;
          "10-defaults" = {
            # https://docs.pipewire.org/page_man_pipewire_conf_5.html
            "context.properties" = lib.mapAttrs (_: lib.mkOptionDefault) {
              "clock.power-of-two-quantum" = true;
              "core.daemon" = true;
              "core.name" = "pipewire-0";
              "link.max-buffers" =
                16; # default is 64, is that really necessary?
              "settings.check-quantum" = true;
            };

            "context.spa-libs" = lib.mapAttrs (_: lib.mkOptionDefault) {
              "audio.convert.*" = "audioconvert/libspa-audioconvert";
              "avb.*" = "avb/libspa-avb";
              "api.alsa.*" = "alsa/libspa-alsa";
              "api.v4l2.*" = "v4l2/libspa-v4l2";
              "api.libcamera.*" = "libcamera/libspa-libcamera";
              "api.bluez5.*" = "bluez5/libspa-bluez5";
              "api.vulkan.*" = "vulkan/libspa-vulkan";
              "api.jack.*" = "jack/libspa-jack";
              "support.*" = "support/libspa-support";
              "video.convert.*" = "videoconvert/libspa-videoconvert";
            };
          };
        };

        pipewire-pulse = {
          # https://docs.pipewire.org/page_man_pipewire-pulse_conf_5.html
          "10-defaults" = {
            "context.spa-libs" = lib.mapAttrs (_: lib.mkOptionDefault) {
              "audio.convert.*" = "audioconvert/libspa-audioconvert";
              "support.*" = "support/libspa-support";
            };

            "pulse.cmd" = lib.mkBefore [{
              cmd = "load-module";
              args = "module-always-sink";
              flags = [ ];
            }];

            "pulse.properties" = {
              "server.address" = lib.mkBefore [ "unix:native" ];
            };

            "pulse.rules" = lib.mkBefore [
              {
                actions.quirks = [ "force-s16-info" ];
                matches = [
                  { "application.process.binary" = "teams"; }
                  { "application.process.binary" = "teams-insiders"; }
                  { "application.process.binary" = "skypeforlinux"; }
                ];
              }
              {
                matches =
                  lib.singleton { "application.process.binary" = "firefox"; };
                actions.quirks = [ "remove-capture-dont-move" ];
              }
              {
                matches =
                  lib.singleton { "application.name" = "~speech-dispatcher*"; };
                actions = {
                  update-props = {
                    "pulse.min.req" = "1024/48000"; # 21ms
                    "pulse.min.quantum " = "1024/48000"; # 21ms
                  };
                };
              }
            ];
          };
        };
      };
    };

    systemd.user.services = {
      pipewire.wantedBy = [ "default.target" ];
      pipewire-pulse.wantedBy = [ "default.target" ];
    };
  };
}
