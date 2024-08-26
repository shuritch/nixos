{ pkgs, ... }: {
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
      # curl  -v4s -o/dev/null -k --connect-to ::google.com -k -H Host:\ metsalehti-staging-s4uzwwd6nq-lz.a.run.app https://test.googlevideo.com/app/uploads/2021/11/2022-mediakortti.pdf -w %{speed_download}
      # curl --http3-only -v4s -o/dev/null -k --connect-to ::google.com -k -H Host:\ metsalehti-staging-s4uzwwd6nq-lz.a.run.app https://test.googlevideo.com/app/uploads/2021/11/2022-mediakortti.pdf -w %{speed_download}
      EnvironmentFile = pkgs.writeText "zapret-environment" ''
        MODE="nfqws"
        FWTYPE="nftables"
        # --dpi-desync-fooling=badseq
        # NFQWS_OPT_DESYNC="--dpi-desync=fake,split2 --dpi-desync-ttl=4 --dpi-desync-ttl6=2 --dpi-desync-split-pos=1 --wssize 1:6 --dpi-desync-fooling=md5sig"
        # NFQWS_OPT_DESYNC="--dpi-desync=fake,split2  --dpi-desync-fooling=md5sig --dpi-desync-split-pos=2"
        NFQWS_OPT_DESYNC_HTTP="--dpi-desync=split --dpi-desync-fooling=md5sig"
        NFQWS_OPT_DESYNC_HTTPS="--dpi-desync=fake,split --dpi-desync-fooling=md5sig --dpi-desync-split-pos=1"

        MODE_HTTP=1
        MODE_HTTP_KEEPALIVE=1
        MODE_HTTPS=1
        MODE_QUIC=0
        MODE_FILTER=none
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
}
