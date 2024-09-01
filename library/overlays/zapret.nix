{ prev, ... }:

prev.zapret.overrideAttrs (attrs: {
  installPhase = ''
    ${attrs.installPhase}
    touch $out/usr/share/zapret/config
    chmod +rw $out/usr/share/zapret/ipset/zapret-hosts-user.txt
    cat << EOF > $out/usr/share/zapret/ipset/zapret-hosts-user.txt
      googlevideo.com
      gvt1.com
      video.google.com
      youtube-nocookie.com
      youtube-ui.l.google.com
      youtubeeducation.com
      googleapis.com
      youtubekids.com
      yt3.ggpht.com
      ytimg.com
      youtu.be
      yt.be
      youtube.com
      nonexistent.domain
      medium.com
      ggpht.com
      l.google.com
      play.google.com
      1e100.net
      googleusercontent.com
      gstatic.com
      nhacmp3youtube.com
      youtubei.googleapis.com
      youtu.be
    EOF
  '';
})
