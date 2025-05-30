{ lib, config, ... }:
# TODO FIX

let
  cfg = config.my.services;
  exists = builtins.pathExists ./sing-box.ignore-this.nix;
  tmp = if exists then (import ./sing-box.ignore-this.nix) else { };
  vpnSettings = tmp // { tag = "vpn-out"; };
in {
  options.my.services.sing-box = {
    enable = lib.mkEnableOption "Enable sing-box.";
  };

  config = lib.mkIf (cfg.sing-box.enable && exists) {
    services.sing-box = {
      enable = true;
      settings = {
        experimental.cache_file.enabled = true;
        log = {
          level = "info";
          timestamp = true;
        };

        dns = {
          servers = [
            {
              tag = "local-dns";
              address = "8.8.8.8";
              detour = "direct-out";
            }
            {
              tag = "cloudflare-dns";
              address = "https://1.1.1.1/dns-query";
              address_resolver = "local-dns";
              detour = "vpn-out";
            }
          ];

          rules = [{
            rule_set = "antizapret";
            server = "cloudflare-dns";
          }];
        };

        inbounds = [{
          type = "tun";
          address = "172.16.0.1/30";
          auto_route = true;
          strict_route = true;
          sniff = true;
          domain_strategy = "prefer_ipv4";
        }];

        outbounds = [
          {
            type = "direct";
            tag = "direct-out";
          }
          vpnSettings
          {
            type = "dns";
            tag = "dns-out";
          }
        ];

        route = {
          final = "direct-out";
          auto_detect_interface = true;
          rule_set = [{
            type = "remote";
            tag = "antizapret";
            format = "binary";
            download_detour = "vpn-out";
            url =
              "https://github.com/savely-krasovsky/antizapret-sing-box/releases/latest/download/antizapret.srs";
          }];

          rules = [
            {
              rule_set = "antizapret";
              outbound = "vpn-out";
            }
            {
              outbound = "vpn-out";
              process_path_regex = [
                "^.*(wget|discord|Discord|vesktop|git|electron|firefox|firefox-bin|nix|nix-index|flatpak|.flatpak-wrappe|.flatpak-wrapped|node)$"
              ];
            }
            {
              outbound = "vpn-out";
              domain = [
                "cloudflare-ech.com"
                "dis.gd"
                "discord-attachments-uploads-prd.storage.googleapis.com"
                "discord.app"
                "discord.co"
                "discord.com"
                "discord.design"
                "discord.dev"
                "discord.gift"
                "discord.gifts"
                "discord.gg"
                "discord.media"
                "discord.new"
                "discord.status"
                "discord.store"
                "discordapp.com"
                "discordapp.net"
                "discordcdn.com"
                "discordmerch.com"
                "discordpartygames.com"
                "discordsays.com"
                "discordsez.com"
                "discord-activities.com"
                "discordactivities.com"
                "stable.dl2.discordapp.net"
                "googlevideo.com"
                "youtu.be"
                "youtube.com"
                "ytimg.com"
                "ggpht.com"
                "jnn-pa.googleapis.com"
                "wide-youtube.l.google.com"
                "youtube-nocookie.com"
                "youtubekids.com"
                "ytimg.l.google.com"
                "youtubeembeddedplayer.googleapis.com"
                "yt-video-upload.l.google.com"
                "youtubei.googleapis.com"
                "youtube-ui.l.google.com"
                "10tv.app"
                "7tv.app"
                "7tv.io"
                "frankerfacez.com"
                "betterttv.net"
                "betterttv.com"
              ];
              domain_suffix = [
                ".google.com"
                ".nhacmp3youtube.com"
                ".googleusercontent.com"
                ".googleapis.com"
                ".gstatic.com"
                ".gvt1.com"
                ".1e100.net"
              ];
            }
            {
              protocol = "dns";
              outbound = "dns-out";
            }
          ];
        };
      };
    };
  };
}
