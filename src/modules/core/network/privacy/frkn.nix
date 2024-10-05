{ lib, config, pkgs, ... }:

let cfg = config.my.network.frkn;
in {
  options.my.network.frkn = {
    enable = lib.mkEnableOption "Enable bolvan/zapret DPI fulling.";

    mode = lib.mkOption {
      type = lib.types.enum [ "nfqws" "tpws" ];
      description = "Firewall type to use.";
      default = "nfqws";
    };

    fwtype = lib.mkOption {
      type = lib.types.enum [ "iptables" "nftables" ];
      description = "Firewall type to use.";
      default =
        lib.head (lib.splitString "-" config.networking.firewall.package.name);
    };

    fulling = lib.mkOption {
      description = "Fulling flags.";
      type = lib.types.str;
      default =
        "--dpi-desync=fake,split --dpi-desync-fooling=md5sig --dpi-desync-split-pos=1";
    };
  };

  config = lib.mkIf cfg.enable {
    users.groups.tpws = { };
    users.users.tpws = {
      isSystemUser = true;
      group = "tpws";
    };

    systemd.services.zapret = {
      path = with pkgs; [ iptables nftables gawk zapret curl procps ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "forking";
        Restart = "no";
        TimeoutSec = "30sec";
        IgnoreSIGPIPE = "no";
        KillMode = "none";
        GuessMainPID = "no";
        ExecStart = "${pkgs.zapret}/bin/zapret start";
        ExecStop = "${pkgs.zapret}/bin/zapret stop";

        # nix-shell -p zapret --run blockcheck
        EnvironmentFile = pkgs.writeText "zapret-environment" ''
          ${lib.toUpper cfg.mode}_OPT_DESYNC="${cfg.fulling}"
          FWTYPE="${cfg.fwtype}"
          MODE="${cfg.mode}"
          MODE_FILTER=none

          MODE_HTTP=1
          MODE_HTTP_KEEPALIVE=1
          MODE_HTTPS=1
          MODE_QUIC=0
          DISABLE_IPV6=1

          INIT_APPLY_FW=1
          TMPDIR=/tmp
          SET_MAXELEM=522288
          IPSET_OPT="hashsize 262144 maxelem $SEX_MAXELEM"
          IP2NET_OPT4="--prefix-length=22-30 --v4-threshold=3/4"
          IP2NET_OPT6="--prefix-length=56-64 --v6-threshold=5"
          AUTOHOSTLIST_RETRANS_THRESHOLD=3
          AUTOHOSTLIST_FAIL_THRESHOLD=3
          AUTOHOSTLIST_FAIL_TIME=60
          AUTOHOSTLIST_DEBUGLOG=0
          MDIG_THREADS=30
          GZIP_LISTS=1
          DESYNC_MARK=0x40000000
          DESYNC_MARK_POSTNAT=0x20000000
          FLOWOFFLOAD=donttouch
          GETLIST=get_antifilter_ipsmart.sh
        '';
      };
    };
  };
}
