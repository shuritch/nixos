{ lib, config, pkgs, ... }:

let cfg = config.my.network.frkn;
in {
  options.my.network.frkn.enable =
    lib.mkEnableOption "Enable bolvan/zapret DPI fulling.";

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
          NFQWS_OPT_DESYNC_QUIC="--dpi-desync=fake,tamper --dpi-desync-any-protocol"
          NFQWS_OPT_DESYNC=${
            lib.concatStrings [
              #  2025-06-23
              "--dpi-desync=syndata,fake,split2 --dpi-desync-fooling=md5sig --dpi-desync-split-pos=1 "
              "--dpi-desync-any-protocol --dpi-desync-ttl=6 --dpi-desync-repeats=20 "
              "--dpi-desync-fake-tls=${./hello_google_com.bin} "
            ]
          }

          FWTYPE="nftables"
          MODE="nfqws"
          MODE_FILTER=none

          MODE_HTTP=0
          MODE_HTTP_KEEPALIVE=0
          MODE_HTTPS=1
          MODE_QUIC=1
          DISABLE_IPV6=1

          INIT_APPLY_FW=1
          TMPDIR=/tmp
          SET_MAXELEM=522288
          QUIC_PORTS=50000-65535
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
